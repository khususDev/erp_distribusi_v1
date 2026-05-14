<!-- Components/Breadcrumbs/Breadcrumb.vue -->
<script setup>
defineProps({
    pageTitle: String,
    parentPath: String,
});
</script>

<template>
    <div
        class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between"
    >
        <h2 class="text-title-md2 font-bold text-black dark:text-white">
            {{ pageTitle }}
        </h2>

        <nav>
            <ol class="flex items-center gap-2">
                <li>
                    <Link class="font-medium" href="/dashboard">
                        Dashboard /
                    </Link>
                </li>
                <li class="font-medium text-primary">{{ pageTitle }}</li>
            </ol>
        </nav>
    </div>
</template>
