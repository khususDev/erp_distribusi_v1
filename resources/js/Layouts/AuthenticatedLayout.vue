<script setup>
import { useSidebar } from "../Tailadmin/composables/useSidebar";
import HeaderArea from "../Tailadmin/components/layout/AppHeader.vue";
import SidebarArea from "../Tailadmin/components/layout/AppSidebar.vue";
import ThemeProvider from "../Tailadmin/components/layout/ThemeProvider.vue";
import { watch, ref } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const { isExpanded, isHovered } = useSidebar();
const page = usePage();
const showToast = ref(false);
const message = ref("");

watch(
    () => page.props.flash?.success,
    (msg) => {
        if (msg) {
            message.value = msg;
            showToast.value = true;

            setTimeout(() => {
                showToast.value = false;
                message.value = "";

                // PENTING: Bersihkan data langsung di pusat state Inertia
                if (page.props.flash) {
                    page.props.flash.success = null;
                }
            }, 3000);
        }
    },
    { immediate: true },
);
</script>

<template>
    <div
        v-if="showToast"
        class="fixed top-24 right-5 z-[99999] flex w-full max-w-sm rounded-md border-l-[6px] border-success bg-white px-4 py-4 shadow-2xl dark:bg-boxdark"
    >
        <div
            class="mr-3 mt-1 flex h-6 w-6 items-center justify-center rounded-full bg-success text-white"
        >
            <svg
                class="fill-current"
                width="14"
                height="10"
                viewBox="0 0 14 10"
            >
                <path d="M5 10L0 5.2L1.4 3.8L5 7.2L12.6 0L14 1.4L5 10Z" />
            </svg>
        </div>
        <div class="w-full">
            <h5 class="mb-1 font-bold text-black dark:text-white">Berhasil!</h5>
            <p class="text-sm font-medium">{{ message }}</p>
        </div>
    </div>
    <ThemeProvider>
        <div class="flex h-screen overflow-hidden bg-whiten dark:bg-boxdark-2">
            <SidebarArea />

            <div
                :class="[
                    'relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden transition-all duration-300',
                    'bg-whiten dark:bg-boxdark-2', // Konsistensi background abu-abu muda
                    isExpanded || isHovered ? 'lg:ml-[290px]' : 'lg:ml-[90px]',
                ]"
            >
                <HeaderArea />

                <main>
                    <div class="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
                        <slot />
                    </div>
                </main>
            </div>
        </div>
    </ThemeProvider>
</template>
