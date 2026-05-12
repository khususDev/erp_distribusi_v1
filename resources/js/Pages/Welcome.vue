<script setup>
import { Head, Link } from "@inertiajs/vue3";

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
});
</script>

<template>
    <Head title="Welcome ERP" />
    <div
        class="flex items-center justify-center min-h-screen bg-gray-100 dark:bg-boxdark-2"
    >
        <div class="text-center">
            <h1 class="text-4xl font-bold text-black dark:text-white mb-8">
                ERP DISTRIBUSI V1
            </h1>

            <div v-if="canLogin" class="space-x-4">
                <Link
                    v-if="$page.props.auth.user"
                    :href="route('dashboard')"
                    class="rounded-md bg-primary px-6 py-3 text-white hover:bg-opacity-90"
                >
                    Go to Dashboard
                </Link>

                <template v-else>
                    <Link
                        :href="route('login')"
                        class="rounded-md bg-primary px-6 py-3 text-white hover:bg-opacity-90"
                    >
                        Log in
                    </Link>
                    <Link
                        v-if="canRegister"
                        :href="route('register')"
                        class="rounded-md border border-primary px-6 py-3 text-primary hover:bg-gray"
                    >
                        Register
                    </Link>
                </template>
            </div>
        </div>
    </div>
</template>
