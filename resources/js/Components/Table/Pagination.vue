<template>
    <div v-if="links.length > 3" class="flex flex-wrap gap-1">
        <template v-for="(link, key) in links" :key="key">
            <div
                v-if="link.url === null"
                class="flex items-center justify-center rounded border border-stroke px-3 py-1.5 text-gray-400 dark:border-strokedark"
                v-html="link.label"
            />
            <Link
                v-else
                :href="link.url"
                class="flex items-center justify-center rounded border border-stroke px-3 py-1.5 font-medium hover:bg-primary hover:text-white dark:border-strokedark dark:text-white"
                :class="{ 'bg-primary text-white border-primary': link.active }"
                v-html="link.label"
            />
        </template>
    </div>
</template>

<script setup>
import { Link } from "@inertiajs/vue3";
defineProps({ links: Array });
</script>
