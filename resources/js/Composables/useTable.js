import { ref, watch } from "vue";
import { router } from "@inertiajs/vue3";

export default function useTable(config) {
    const search = ref(config.search ?? "");
    const entries = ref(config.entries ?? 10);
    const filters = ref(config.filters ?? {});

    // =========================
    // SEARCH DEBOUNCE
    // =========================
    let timeout = null;

    watch(search, (value) => {
        clearTimeout(timeout);

        timeout = setTimeout(() => {
            reload();
        }, 500);
    });

    // =========================
    // ENTRIES CHANGE
    // =========================
    watch(entries, () => {
        reload();
    });

    // =========================
    // FILTERS
    // =========================
    watch(
        filters,
        () => {
            reload();
        },
        { deep: true }
    );


    // =========================
    // RELOAD TABLE
    // =========================
    const reload = () => {
        router.get(
            config.route,
            {
                search: search.value,
                entries: entries.value,
            },
            {
                preserveState: true,
                replace: true,
                preserveScroll: true,
            }
        );
    };

    return {
        search,
        entries,
        filters,
    };
}