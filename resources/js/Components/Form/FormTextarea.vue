<script setup>
defineProps({
    modelValue: String,
    label: String,
    rows: {
        type: Number,
        default: 3,
    },
    error: String,
});

defineEmits(["update:modelValue"]);
</script>

<template>
    <div>
        <label class="mb-2.5 block text-black dark:text-white">
            {{ label }}
        </label>

        <textarea
            :rows="rows"
            :value="modelValue"
            @input="$emit('update:modelValue', $event.target.value)"
            class="w-full rounded-lg border border-stroke bg-transparent py-3 px-5 outline-none focus:border-primary dark:border-strokedark dark:bg-form-input"
        ></textarea>

        <p v-if="error" class="mt-1 text-sm text-danger">
            {{ error }}
        </p>
    </div>
</template>
