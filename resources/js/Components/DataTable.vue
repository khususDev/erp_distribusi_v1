<template>
    <div
        class="rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark"
    >
        <div
            class="px-4 py-6 md:px-6 xl:px-7.5 flex justify-between items-center border-b border-stroke dark:border-strokedark"
        >
            <h4 class="text-xl font-semibold text-black dark:text-white">
                {{ title }}
            </h4>
            <slot name="header-action"></slot>
        </div>

        <div class="max-w-full overflow-x-auto">
            <table class="w-full table-auto">
                <thead>
                    <tr class="bg-gray-2 text-left dark:bg-meta-4">
                        <th
                            v-for="header in headers"
                            :key="header"
                            class="px-4 py-4 font-medium text-black dark:text-white uppercase text-sm"
                        >
                            {{ header }}
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <slot></slot>
                    <tr v-if="isEmpty">
                        <td
                            :colspan="headers.length"
                            class="text-center py-10 text-gray-500"
                        >
                            Data belum tersedia.
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script setup>
defineProps({
    title: String,
    headers: Array,
    isEmpty: Boolean,
});
</script>
