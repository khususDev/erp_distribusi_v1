<template>
    <div
        class="rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark"
    >
        <div
            v-if="showEntries || showSearch || $slots['top-actions']"
            class="flex flex-col gap-5 border-b border-stroke px-4 py-6 md:flex-row md:items-center md:justify-between md:px-6 xl:px-7.5 dark:border-strokedark"
        >
            <div v-if="showEntries" class="flex items-center gap-3">
                <span class="text-black dark:text-white text-sm">Show</span>

                <div class="relative">
                    <select
                        @change="$emit('update:entries', $event.target.value)"
                        style="background-image: none"
                        class="appearance-none [&::-ms-expand]:hidden rounded border border-stroke bg-transparent py-1 pl-3 pr-8 outline-none focus:border-primary dark:border-strokedark dark:bg-meta-4"
                    >
                        <option value="5">5</option>
                        <option value="10" selected>10</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>

                    <span
                        class="pointer-events-none absolute right-2 top-1/2 -translate-y-1/2"
                    >
                        <svg
                            class="fill-current"
                            width="12"
                            height="8"
                            viewBox="0 0 12 8"
                            fill="none"
                        >
                            <path
                                d="M1.5 1.5L6 6L10.5 1.5"
                                stroke="currentColor"
                                stroke-width="1.5"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                            />
                        </svg>
                    </span>
                </div>

                <span class="text-black dark:text-white text-sm">entries</span>
            </div>

            <div class="flex items-center gap-4 ml-auto">
                <div v-if="showSearch" class="relative">
                    <span class="absolute left-4 top-1/2 -translate-y-1/2">
                        <svg
                            class="fill-body hover:fill-primary"
                            width="18"
                            height="18"
                            viewBox="0 0 20 20"
                            fill="none"
                        >
                            <path
                                d="M19.225 17.8125L13.9125 12.5C14.9375 11.2375 15.5375 9.6375 15.5375 7.875C15.5375 3.65 12.1125 0.225 7.875 0.225C3.6375 0.225 0.225 3.65 0.225 7.875C0.225 12.1 3.65 15.525 7.875 15.525C9.6375 15.525 11.2375 14.925 12.5 13.9125L17.8125 19.225C18.0125 19.425 18.275 19.525 18.525 19.525C18.775 19.525 19.0375 19.425 19.225 19.225C19.6125 18.825 19.6125 18.2 19.225 17.8125ZM7.875 13.9125C4.525 13.9125 1.8375 11.2125 1.8375 7.875C1.8375 4.5375 4.525 1.8375 7.875 1.8375C11.225 1.8375 13.9125 4.5375 13.9125 7.875C13.9125 11.2125 11.225 13.9125 7.875 13.9125Z"
                                fill=""
                            />
                        </svg>
                    </span>
                    <input
                        type="text"
                        placeholder="Type to search..."
                        @input="$emit('search', $event.target.value)"
                        class="w-full rounded-md border border-stroke bg-transparent py-2 pl-10 pr-4 outline-none focus:border-primary dark:border-strokedark dark:bg-meta-4"
                    />
                </div>

                <slot name="top-actions"></slot>
            </div>
        </div>

        <div class="max-w-full overflow-x-auto">
            <table class="w-full table-auto">
                <thead>
                    <tr class="bg-gray-2 text-left dark:bg-meta-4">
                        <th
                            class="px-4 py-4 font-medium text-black dark:text-white xl:pl-11"
                        >
                            <input
                                type="checkbox"
                                class="h-4 w-4 rounded border-stroke"
                            />
                        </th>
                        <th
                            v-for="header in headers"
                            :key="header"
                            class="px-4 py-4 font-medium text-black dark:text-white uppercase text-xs tracking-wider"
                        >
                            {{ header }}
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <slot></slot>
                </tbody>
            </table>
        </div>

        <div
            v-if="showPagination"
            class="flex flex-col items-center justify-between gap-4 border-t border-stroke px-4 py-6 md:flex-row md:px-6 xl:px-7.5 dark:border-strokedark"
        >
            <p class="font-medium text-sm text-black dark:text-white">
                Showing {{ from ?? 0 }} to {{ to ?? 0 }} of
                {{ total ?? 0 }} entries
            </p>

            <div class="flex items-center gap-2">
                <slot name="pagination"></slot>
            </div>
        </div>
    </div>
</template>

<script setup>
defineProps({
    headers: Array, // Judul kolom
    from: Number, // Info dari (pagination)
    to: Number, // Info sampai (pagination)
    total: Number, // Total semua data
    showEntries: {
        // Saklar entries
        type: Boolean,
        default: true,
    },
    showSearch: {
        // Saklar search
        type: Boolean,
        default: true,
    },
    showPagination: {
        // Saklar pagination
        type: Boolean,
        default: true,
    },
});

defineEmits(["search", "update:entries"]);
</script>
