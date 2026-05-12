<script setup>
    import {
        Head,
        Link
    } from '@inertiajs/vue3';

    defineProps({
        canLogin: Boolean,
        canRegister: Boolean,
    });
</script>

<template>

    <Head title="Welcome" />
    <div class="flex min-h-screen items-center justify-center bg-whiten dark:bg-boxdark-2">
        <div class="text-center">
            <h1 class="mb-4 text-4xl font-bold text-black dark:text-white">ERP DISTRIBUSI V1</h1>
            <p class="mb-8 text-body">Selamat datang di sistem manajemen distribusi.</p>

            <div v-if="canLogin" class="flex justify-center gap-4">
                <Link v-if="$page.props.auth.user" :href="route('dashboard')"
                    class="inline-flex items-center justify-center rounded-md bg-primary py-3 px-10 text-center font-medium text-white hover:bg-opacity-90">
                Buka Dashboard
                </Link>

                <template v-else>
                    <Link :href="route('login')"
                        class="inline-flex items-center justify-center rounded-md bg-primary py-3 px-10 text-center font-medium text-white hover:bg-opacity-90">
                    Log In
                    </Link>
                    <Link v-if="canRegister" :href="route('register')"
                        class="inline-flex items-center justify-center rounded-md border border-primary py-3 px-10 text-center font-medium text-primary hover:bg-opacity-10">
                    Register
                    </Link>
                </template>
            </div>
        </div>
    </div>
</template>
