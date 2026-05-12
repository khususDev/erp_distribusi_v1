<script setup>
import AuthenticatedLayout from "../Layouts/AuthenticatedLayout.vue";
import { Head } from "@inertiajs/vue3";
import { ref } from "vue";

// Definisikan props jika Anda mengirimkan data dari Controller
const props = defineProps({
    auth: Object,
    menus: Array,
});
</script>

<template>
    <Head title="Dashboard ERP" />

    <AuthenticatedLayout>
        <div
            class="grid grid-cols-1 gap-4 md:grid-cols-2 md:gap-6 xl:grid-cols-4 2xl:gap-7.5"
        >
            <div
                class="rounded-sm border border-stroke bg-white py-6 px-7.5 shadow-default dark:border-strokedark dark:bg-boxdark"
            >
                <h4 class="text-title-md font-bold text-black dark:text-white">
                    Selamat Datang!
                </h4>
                <p class="font-medium">Halo, {{ auth.user.name }}</p>
                <p class="text-sm text-gray-500 mt-2">
                    Sistem ERP Distribusi siap digunakan.
                </p>
            </div>
        </div>

        <div
            class="mt-4 grid grid-cols-12 gap-4 md:mt-6 md:gap-6 2xl:mt-7.5 2xl:gap-7.5"
        >
            <div
                class="col-span-12 rounded-sm border border-stroke bg-white px-5 pt-6 pb-2.5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:col-span-8"
            >
                <h3 class="font-semibold text-black dark:text-white mb-4">
                    Ringkasan Aktivitas
                </h3>
                <div
                    class="flex h-64 items-center justify-center border-2 border-dashed border-stroke"
                >
                    <p class="text-gray-400">
                        Konten Tabel atau Chart ERP Distribusi Anda
                    </p>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
