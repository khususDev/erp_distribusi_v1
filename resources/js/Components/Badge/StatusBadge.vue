<script setup>
defineProps({
    value: Boolean,
});
</script>

<template>
    <span
        :class="
            value ? 'bg-success/10 text-success' : 'bg-danger/10 text-danger'
        "
        class="inline-flex rounded-full px-3 py-1 text-sm font-medium"
    >
        {{ value ? "Active" : "Inactive" }}
    </span>
</template>
