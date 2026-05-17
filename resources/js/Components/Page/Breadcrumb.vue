<script setup>
import { computed } from "vue";
import { usePage, Link } from "@inertiajs/vue3";

const props = defineProps({
    pageTitle: String,
    crumbs: {
        type: Array,
        default: () => [],
    },
});

const page = usePage();

const dynamicCrumbs = computed(() => {
    if (props.crumbs && props.crumbs.length > 0) {
        return props.crumbs;
    }

    const path = page.url.split("?")[0]; // Abaikan query string (misal: ?page=2)
    let segments = path.split("/").filter(Boolean); // Pecah url dan buang yang kosong

    // Buang segmen terakhir, karena segmen terakhir biasanya adalah `pageTitle`
    segments.pop();

    // Format teksnya: hilangkan strip/underscore, jadikan Huruf Kapital per kata
    return segments.map((segment) => {
        return segment
            .replace(/[-_]/g, " ")
            .replace(/\b\w/g, (char) => char.toUpperCase());
    });
});
</script>

<template>
    <div
        class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between"
    >
        <h3
            class="text-title-md2 font-bold text-black dark:text-white uppercase tracking-wide text-xl"
        >
            {{ pageTitle }}
        </h3>

        <nav>
            <ol
                class="flex items-center gap-2 text-sm font-small text-gray-500"
            >
                <li>
                    <Link
                        href="/dashboard"
                        class="hover:text-primary transition"
                        >Home</Link
                    >
                </li>

                <li
                    v-for="(crumb, index) in dynamicCrumbs"
                    :key="index"
                    class="flex items-center gap-2"
                >
                    <span>/</span>
                    <span class="cursor-default">{{ crumb }}</span>
                </li>

                <li class="flex items-center gap-2 text-primary font-semibold">
                    <span>/</span>
                    <span>{{ pageTitle }}</span>
                </li>
            </ol>
        </nav>
    </div>
</template>
