<script setup>
defineProps({
    modelValue: [String, Number],
    label: String,
    options: Array,
    optionValue: {
        type: String,
        default: "id",
    },
    optionLabel: {
        type: String,
        default: "name",
    },
    placeholder: {
        type: String,
        default: "Pilih Data",
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

        <select
            :value="modelValue"
            @change="$emit('update:modelValue', $event.target.value)"
            class="w-full rounded-lg border border-stroke bg-transparent py-3 px-5 outline-none focus:border-primary dark:border-strokedark dark:bg-form-input"
        >
            <option value="">{{ placeholder }}</option>

            <option
                v-for="option in options"
                :key="option[optionValue]"
                :value="option[optionValue]"
            >
                {{ option[optionLabel] }}
            </option>
        </select>

        <p v-if="error" class="mt-1 text-sm text-danger">
            {{ error }}
        </p>
    </div>
</template>
