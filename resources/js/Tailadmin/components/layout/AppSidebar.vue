<script setup>
import { computed } from "vue";
import { usePage, Link } from "@inertiajs/vue3";
// Import semua icon TailAdmin
import * as Icons from "../../icons";
import SidebarWidget from "../layout/SidebarWidget.vue";
import { useSidebar } from "../../composables/useSidebar";

const { isExpanded, isMobileOpen, isHovered, openSubmenu } = useSidebar();
const page = usePage();

// 1. Ambil data menu dari database (via Inertia Props)
const menusFromDb = computed(() => page.props.menus);

// 2. Fungsi Helper untuk memanggil Icon berdasarkan string di Database
const getIcon = (iconName) => {
    if (!iconName) return Icons.GridIcon;
    return Icons[iconName] || Icons.GridIcon;
};

const isActive = (routeName) => {
    if (!routeName) return false;
    try {
        // Cek apakah route ini ada di daftar route Laravel
        return route().current(routeName);
    } catch (e) {
        console.warn(`Route "${routeName}" tidak ditemukan.`);
        return false;
    }
};

const toggleSubmenu = (index) => {
    openSubmenu.value = openSubmenu.value === index ? null : index;
};

const isParentActive = (item) => {
    if (item.route && isActive(item.route)) return true;
    if (item.children) {
        return item.children.some((child) => {
            if (child.route && isActive(child.route)) return true;
            if (child.children)
                return child.children.some(
                    (grand) => grand.route && isActive(grand.route),
                );
            return false;
        });
    }
    return false;
};

const isOpened = (index, item) => {
    return (
        openSubmenu.value === index ||
        // Cek apakah openSubmenu saat ini adalah anak dari index ini (misal: '1-0' adalah anak dari '1')
        (typeof openSubmenu.value === "string" &&
            openSubmenu.value.startsWith(index + "-")) ||
        // Tetap buka jika ada halaman aktif di dalam hirarkinya
        item.children?.some(
            (child) =>
                isActive(child.route) ||
                child.children?.some((grand) => isActive(grand.route)),
        )
    );
};

const startTransition = (el) => {
    el.style.height = "auto";
    const height = el.scrollHeight;
    el.style.height = "0px";
    el.offsetHeight;
    el.style.height = height + "px";
};

const endTransition = (el) => {
    el.style.height = "";
};
</script>

<template>
    <aside
        :class="[
            'fixed mt-16 flex flex-col lg:mt-0 top-0 px-5 left-0 bg-white dark:bg-gray-900 h-screen transition-all duration-300 ease-in-out z-99999 border-r border-stroke',
            {
                'lg:w-[290px]': isExpanded || isHovered,
                'lg:w-[90px]': !isExpanded && !isHovered,
            },
        ]"
    >
        <div class="py-4 flex">
            <Link :href="route('dashboard')">
                <img
                    src="/images/linera-logo/new-linerago.svg"
                    alt="Logo"
                    width="auto"
                    v-if="isExpanded || isHovered"
                />
                <img
                    src="/images/linera-logo/new-linerago-mini.svg"
                    alt="Logo"
                    width="auto"
                    v-else
                />
            </Link>
        </div>

        <div class="flex flex-col overflow-y-auto no-scrollbar">
            <nav class="mb-6">
                <h2
                    class="mb-4 text-xs uppercase text-bodydark2"
                    v-if="isExpanded || isHovered"
                >
                    Main Menu
                </h2>

                <ul class="flex flex-col gap-2">
                    <li v-for="(item, index) in menusFromDb" :key="item.id">
                        <Link
                            v-if="item.route"
                            :href="route(item.route)"
                            :class="[
                                'menu-item group',
                                isActive(item.route) ? 'menu-item-active' : '',
                            ]"
                        >
                            <span
                                :class="
                                    isActive(item.route)
                                        ? 'text-primary'
                                        : 'text-black'
                                "
                            >
                                <component
                                    :is="getIcon(item.icon)"
                                    class="fill-current"
                                />
                            </span>
                            <span
                                v-if="isExpanded || isHovered"
                                :class="
                                    isActive(item.route)
                                        ? 'text-primary'
                                        : 'text-black'
                                "
                            >
                                {{ item.name }}
                            </span>
                        </Link>

                        <template
                            v-else-if="
                                item.children && item.children.length > 0
                            "
                        >
                            <button
                                @click="toggleSubmenu(index)"
                                :class="[
                                    'menu-item group w-full',
                                    isParentActive(item)
                                        ? 'menu-item-active'
                                        : '',
                                ]"
                            >
                                <span
                                    :class="
                                        isParentActive(item)
                                            ? 'text-primary'
                                            : 'text-black'
                                    "
                                >
                                    <component
                                        :is="getIcon(item.icon)"
                                        class="fill-current"
                                    />
                                </span>
                                <span
                                    v-if="isExpanded || isHovered"
                                    :class="
                                        isParentActive(item)
                                            ? 'text-primary'
                                            : 'text-black'
                                    "
                                >
                                    {{ item.name }}
                                </span>
                                <Icons.ChevronDownIcon
                                    v-if="isExpanded || isHovered"
                                    :class="[
                                        'ml-auto w-5 h-5 transition-transform',
                                        isOpened(index, item)
                                            ? 'rotate-180'
                                            : '',
                                    ]"
                                />
                            </button>

                            <transition
                                @enter="startTransition"
                                @after-enter="endTransition"
                                @before-leave="startTransition"
                                @after-leave="endTransition"
                            >
                                <div
                                    v-show="
                                        isOpened(index, item) &&
                                        (isExpanded || isHovered)
                                    "
                                >
                                    <ul class="mt-2 space-y-1 ml-9">
                                        <li
                                            v-for="(
                                                child, childIndex
                                            ) in item.children"
                                            :key="child.id"
                                        >
                                            <Link
                                                v-if="child.route"
                                                :href="route(child.route)"
                                                :class="[
                                                    'menu-dropdown-item py-1',
                                                    isActive(child.route)
                                                        ? 'menu-dropdown-item-active'
                                                        : 'text-black',
                                                ]"
                                            >
                                                {{ child.name }}
                                            </Link>

                                            <template
                                                v-else-if="
                                                    child.children &&
                                                    child.children.length > 0
                                                "
                                            >
                                                <button
                                                    @click.stop="
                                                        toggleSubmenu(
                                                            index +
                                                                '-' +
                                                                childIndex,
                                                        )
                                                    "
                                                    class="menu-dropdown-item py-1 text-black flex items-center w-full"
                                                >
                                                    <span
                                                        :class="
                                                            openSubmenu ===
                                                            index +
                                                                '-' +
                                                                childIndex
                                                                ? 'text-primary'
                                                                : ''
                                                        "
                                                    >
                                                        {{ child.name }}
                                                    </span>

                                                    <Icons.ChevronDownIcon
                                                        :class="[
                                                            'ml-auto w-4 h-4 transition-transform',
                                                            openSubmenu ===
                                                            index +
                                                                '-' +
                                                                childIndex
                                                                ? 'rotate-180 text-primary'
                                                                : '',
                                                        ]"
                                                    />
                                                </button>

                                                <ul
                                                    v-show="
                                                        openSubmenu ===
                                                        index + '-' + childIndex
                                                    "
                                                    class="mt-1 space-y-1 ml-4 border-l border-stroke pl-4"
                                                >
                                                    <li
                                                        v-for="grandChild in child.children"
                                                        :key="grandChild.id"
                                                    >
                                                        <Link
                                                            :href="
                                                                route(
                                                                    grandChild.route,
                                                                )
                                                            "
                                                            :class="[
                                                                'menu-dropdown-item py-1 text-xs',
                                                                isActive(
                                                                    grandChild.route,
                                                                )
                                                                    ? 'text-primary'
                                                                    : 'text-black',
                                                            ]"
                                                        >
                                                            {{
                                                                grandChild.name
                                                            }}
                                                        </Link>
                                                    </li>
                                                </ul>
                                            </template>
                                        </li>
                                    </ul>
                                </div>
                            </transition>
                        </template>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
</template>
