<script setup>
import { Link } from "@inertiajs/vue3";
import { ref, onMounted, onUnmounted } from "vue";

const dropdownOpen = ref(false);
const trigger = ref(null);
const dropdown = ref(null);

const clickHandler = ({ target }) => {
    if (
        !dropdownOpen.value ||
        dropdown.value.contains(target) ||
        trigger.value.contains(target)
    )
        return;
    dropdownOpen.value = false;
};

onMounted(() => {
    document.addEventListener("click", clickHandler);
});

onUnmounted(() => {
    document.removeEventListener("click", clickHandler);
});
</script>

<template>
    <div class="relative">
        <Link
            ref="trigger"
            @click.prevent="dropdownOpen = !dropdownOpen"
            class="flex items-center gap-4"
            href="#"
        >
            <span class="hidden text-right lg:block">
                <span
                    class="block text-sm font-medium text-black dark:text-white"
                    >{{ $page.props.auth.user.name }}</span
                >
                <span class="block text-xs font-medium">Super Admin</span>
            </span>

            <span class="h-12 w-12 rounded-full">
                <img
                    src="/images/user/owner.jpg"
                    alt="User"
                    class="rounded-full"
                />
            </span>

            <svg
                class="hidden fill-current sm:block"
                width="12"
                height="8"
                viewBox="0 0 12 8"
                fill="none"
            >
                <path
                    d="M5.99908 7.75208C5.84908 7.75208 5.72408 7.67708 5.59908 7.57708L0.474081 2.37708C0.299081 2.20208 0.299081 1.92708 0.474081 1.75208C0.649081 1.57708 0.924081 1.57708 1.09908 1.75208L5.99908 6.62708L10.8991 1.72708C11.0741 1.55208 11.3491 1.55208 11.5241 1.72708C11.6991 1.90208 11.6991 2.17708 11.5241 2.35208L6.39908 7.55208C6.27408 7.67708 6.14908 7.75208 5.99908 7.75208Z"
                />
            </svg>
        </Link>

        <div
            v-show="dropdownOpen"
            ref="dropdown"
            class="absolute right-0 mt-4 flex w-62.5 flex-col rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark"
        >
            <ul
                class="flex flex-col gap-5 border-b border-stroke px-6 py-7.5 dark:border-strokedark"
            >
                <li>
                    <Link
                        href="/profile"
                        class="flex items-center gap-3.5 text-sm font-medium duration-300 ease-in-out hover:text-primary lg:text-base"
                    >
                        My Profile
                    </Link>
                </li>
            </ul>
            <Link
                :href="route('logout')"
                method="post"
                as="button"
                class="flex items-center gap-3.5 px-6 py-4 text-sm font-medium duration-300 ease-in-out hover:text-primary lg:text-base"
            >
                Log Out
            </Link>
        </div>
    </div>
</template>
