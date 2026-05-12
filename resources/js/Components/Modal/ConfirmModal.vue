<script setup>
defineProps({
    show: Boolean,
    title: String,
    message: String,
});

defineEmits(["close", "confirm"]);
</script>

<template>
    <Modal :show="show" :title="title" @close="$emit('close')">
        <p class="text-sm text-bodydark mb-5">
            {{ message }}
        </p>

        <template #footer>
            <div class="flex gap-3">
                <button
                    @click="$emit('close')"
                    class="rounded border border-stroke px-5 py-2"
                >
                    Batal
                </button>

                <button
                    @click="$emit('confirm')"
                    class="rounded bg-danger px-5 py-2 text-white"
                >
                    Ya, Hapus
                </button>
            </div>
        </template>
    </Modal>
</template>
