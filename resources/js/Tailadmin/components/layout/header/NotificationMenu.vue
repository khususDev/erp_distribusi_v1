<script setup>
import { Link } from "@inertiajs/vue3";
import { ref, onMounted, onUnmounted } from "vue";

const dropdownOpen = ref(false);
const notifying = ref(true);

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

const keyHandler = ({ keyCode }) => {
    if (!dropdownOpen.value || keyCode !== 27) return;
    dropdownOpen.value = false;
};

onMounted(() => {
    document.addEventListener("click", clickHandler);
    document.addEventListener("keydown", keyHandler);
});

onUnmounted(() => {
    document.removeEventListener("click", clickHandler);
    document.removeEventListener("keydown", keyHandler);
});
</script>

<template>
    <li class="relative">
        <button
            ref="trigger"
            @click.prevent="dropdownOpen = !dropdownOpen"
            class="relative flex h-8.5 w-8.5 items-center justify-center rounded-full border-[0.5px] border-stroke bg-gray hover:text-primary dark:border-strokedark dark:bg-meta-4 dark:text-white"
        >
            <span
                :class="!notifying && 'hidden'"
                class="absolute -top-0.5 right-0 z-1 h-2 w-2 rounded-full bg-meta-1"
            >
                <span
                    class="absolute -z-1 inline-flex h-full w-full animate-ping rounded-full bg-meta-1 opacity-75"
                ></span>
            </span>

            <svg
                class="fill-current duration-300 ease-in-out"
                width="18"
                height="18"
                viewBox="0 0 18 18"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
            >
                <path
                    d="M16.1999 14.9344L15.6374 14.0625C15.5249 13.8937 15.4687 13.725 15.4687 13.5281V8.46563C15.4687 5.23125 12.9374 2.5875 9.70303 2.33438V1.71563C9.70303 1.32188 9.39365 1 8.9999 1C8.60615 1 8.29678 1.32188 8.29678 1.71563V2.33438C5.0624 2.5875 2.53115 5.23125 2.53115 8.46563V13.5281C2.53115 13.725 2.4749 13.8937 2.3624 14.0625L1.7999 14.9344C1.63115 15.2156 1.63115 15.5531 1.7999 15.8344C1.96865 16.0875 2.25 16.2562 2.53115 16.2562H15.4687C15.7499 16.2562 16.0312 16.0875 16.1999 15.8344C16.3687 15.5531 16.3968 15.2156 16.1999 14.9344Z"
                    fill=""
                />
            </svg>
        </button>

        <div
            v-show="dropdownOpen"
            ref="dropdown"
            class="absolute -right-27 mt-2.5 flex h-90 w-75 flex-col rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark sm:right-0 sm:w-80"
        >
            <div class="px-4.5 py-3">
                <h5 class="text-sm font-medium text-bodydark2">Notification</h5>
            </div>

            <ul class="flex h-auto flex-col overflow-y-auto">
                <li>
                    <Link
                        class="flex flex-col gap-2.5 border-t border-stroke px-4.5 py-3 hover:bg-gray-2 dark:border-strokedark dark:hover:bg-meta-4"
                        href="#"
                    >
                        <p class="text-sm">
                            <span class="text-black dark:text-white"
                                >Admin</span
                            >
                            memproses pesanan baru.
                        </p>
                        <p class="text-xs">12 May, 2026</p>
                    </Link>
                </li>
            </ul>
        </div>
    </li>
</template>
