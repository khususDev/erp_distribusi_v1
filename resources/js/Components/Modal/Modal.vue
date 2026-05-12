<template>
    <div
        v-if="show"
        class="fixed inset-0 z-[999] flex items-center justify-center bg-black bg-opacity-50 px-4"
    >
        <div
            class="w-full max-w-lg rounded-lg bg-white p-8 shadow-lg dark:bg-boxdark"
        >
            <div
                class="mb-6 flex items-center justify-between border-b border-stroke pb-4 dark:border-strokedark"
            >
                <h3 class="text-xl font-semibold text-black dark:text-white">
                    {{ title }}
                </h3>
                <button
                    @click="$emit('close')"
                    class="text-2xl hover:text-danger"
                >
                    &times;
                </button>
            </div>

            <div class="mb-6">
                <slot></slot>
            </div>

            <div
                class="flex justify-end gap-4 border-t border-stroke pt-4 dark:border-strokedark"
            >
                <button
                    @click="$emit('close')"
                    class="rounded border border-stroke px-6 py-2 font-medium text-black hover:shadow-1 dark:border-strokedark dark:text-white"
                >
                    Batal
                </button>
                <slot name="footer"></slot>
            </div>
        </div>
    </div>
</template>

<script setup>
defineProps({ show: Boolean, title: String });
defineEmits(["close"]);
</script>
