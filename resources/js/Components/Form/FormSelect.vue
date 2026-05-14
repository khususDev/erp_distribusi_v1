<script setup>
defineProps({
    modelValue: [String, Number],
    label: String,
    error: String,
    options: {
        type: Array,
        default: () => [],
    },
    valueField: {
        type: String,
        default: "id",
    },
    labelField: {
        type: String,
        default: "name",
    },
    placeholder: {
        type: String,
        default: "Pilih Data",
    },
});

defineEmits(["update:modelValue"]);
</script>

<template>
    <div>
        <label class="mb-2.5 block text-black dark:text-white">
            {{ label }}
        </label>

        <div class="relative">
            <select
                :value="modelValue"
                @change="$emit('update:modelValue', $event.target.value)"
                class="w-full appearance-none rounded-lg border border-stroke bg-transparent px-5 py-3 outline-none transition focus:border-primary dark:border-strokedark dark:bg-form-input dark:focus:border-primary"
            >
                <option value="">
                    {{ placeholder }}
                </option>

                <option
                    v-for="option in options"
                    :key="option[valueField]"
                    :value="option[valueField]"
                >
                    {{ option[labelField] }}
                </option>
            </select>

            <span class="absolute right-4 top-1/2 -translate-y-1/2">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                    <path
                        d="M5 7.5L10 12.5L15 7.5"
                        stroke="currentColor"
                        stroke-width="1.5"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                    />
                </svg>
            </span>
        </div>

        <p v-if="error" class="mt-1 text-sm text-danger">
            {{ error }}
        </p>
    </div>
</template>
