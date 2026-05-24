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

    if (Icons[iconName]) return Icons[iconName];

    const capitalized = iconName.charAt(0).toUpperCase() + iconName.slice(1);

    if (Icons[capitalized]) return Icons[capitalized];
    if (Icons[capitalized + "Icon"]) return Icons[capitalized + "Icon"];

    console.warn(
        `Icon "${iconName}" dari database tidak ditemukan di file icons. Menampilkan GridIcon sebagai default.`,
    );

    return Icons.GridIcon;
};

const isActive = (routeName) => {
    if (!routeName) return false;
    try {
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
        (typeof openSubmenu.value === "string" &&
            openSubmenu.value.startsWith(index + "-")) ||
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
        @mouseenter="isHovered = true"
        @mouseleave="isHovered = false"
        :class="[
            'fixed mt-16 flex flex-col lg:mt-0 top-0 px-5 left-0 bg-white dark:bg-gray-900 h-screen transition-all duration-300 ease-in-out z-99999 border-r border-stroke',
            'w-[250px]',
            {
                'lg:w-[250px]': isExpanded || isHovered,
                'lg:w-[80px]': !isExpanded && !isHovered,
                'translate-x-0': isMobileOpen,
                '-translate-x-full lg:translate-x-0': !isMobileOpen,
            },
        ]"
    >
        <div class="py-3 flex justify-center items-center w-full mr-1 mb-1">
            <Link
                :href="route('dashboard')"
                @click="
                    isHovered = false;
                    openSubmenu = null;
                "
                class="flex justify-center"
            >
                <img
                    src="/images/linera-logo/new-linerago.svg"
                    alt="Logo"
                    class="w-full max-w-[200px] object-contain"
                    v-if="isExpanded || isHovered"
                />
                <img
                    src="/images/linera-logo/new-linerago-mini.svg"
                    alt="Logo"
                    class="w-full max-w-[45px] object-contain"
                    v-else
                />
            </Link>
        </div>

        <hr />

        <div class="flex flex-col overflow-y-auto no-scrollbar mt-4">
            <template
                v-for="(group, groupIndex) in menusFromDb"
                :key="group.id || groupIndex"
            >
                <nav class="mb-6">
                    <h2
                        class="mb-4 text-xs uppercase text-bodydark2"
                        v-if="isExpanded || isHovered"
                    >
                        {{ group.group_name }}
                    </h2>

                    <ul class="flex flex-col gap-2 text-sm">
                        <li v-for="(item, index) in group.menus" :key="item.id">
                            <Link
                                v-if="item.route"
                                :href="route(item.route)"
                                @click="
                                    isHovered = false;
                                    openSubmenu = null;
                                "
                                :class="[
                                    'menu-item group mt-2',
                                    isActive(item.route)
                                        ? 'menu-item-active'
                                        : '',
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
                                        class="fill-current w-5 h-5"
                                    />
                                </span>
                                <span
                                    v-if="isExpanded || isHovered"
                                    :class="
                                        isActive(item.route)
                                            ? 'text-primary'
                                            : 'text-secondary'
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
                                    @click="
                                        toggleSubmenu(groupIndex + '-' + index)
                                    "
                                    :class="[
                                        'menu-item group w-full mt-2',
                                        isParentActive(item)
                                            ? 'menu-item-active'
                                            : '',
                                    ]"
                                >
                                    <span
                                        :class="
                                            isParentActive(item)
                                                ? 'text-primary'
                                                : 'text-secondary'
                                        "
                                    >
                                        <component
                                            :is="getIcon(item.icon)"
                                            class="fill-current w-5 h-5"
                                        />
                                    </span>
                                    <span
                                        v-if="isExpanded || isHovered"
                                        :class="
                                            isParentActive(item)
                                                ? 'text-primary'
                                                : 'text-secondary'
                                        "
                                    >
                                        {{ item.name }}
                                    </span>
                                    <Icons.ChevronDownIcon
                                        v-if="isExpanded || isHovered"
                                        :class="[
                                            'ml-auto w-5 h-5 transition-transform text-secondary',
                                            isOpened(
                                                groupIndex + '-' + index,
                                                item,
                                            )
                                                ? ''
                                                : '-rotate-90',
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
                                            isOpened(
                                                groupIndex + '-' + index,
                                                item,
                                            ) &&
                                            (isExpanded || isHovered)
                                        "
                                    >
                                        <ul
                                            class="mt-2 space-y-1 ml-6 border-l border-stroke pl-3"
                                        >
                                            <li
                                                v-for="(
                                                    child, childIndex
                                                ) in item.children"
                                                :key="child.id"
                                            >
                                                <Link
                                                    v-if="child.route"
                                                    :href="route(child.route)"
                                                    @click="isHovered = false"
                                                    :class="[
                                                        'menu-dropdown-item py-1',
                                                        isActive(child.route)
                                                            ? 'menu-dropdown-item-active'
                                                            : 'text-secondary',
                                                    ]"
                                                >
                                                    {{ child.name }}
                                                </Link>

                                                <template
                                                    v-else-if="
                                                        child.children &&
                                                        child.children.length >
                                                            0
                                                    "
                                                >
                                                    <button
                                                        @click.stop="
                                                            toggleSubmenu(
                                                                groupIndex +
                                                                    '-' +
                                                                    index +
                                                                    '-' +
                                                                    childIndex,
                                                            )
                                                        "
                                                        class="menu-dropdown-item py-1 text-secondary flex items-center w-full"
                                                    >
                                                        <span
                                                            :class="
                                                                openSubmenu ===
                                                                groupIndex +
                                                                    '-' +
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
                                                                groupIndex +
                                                                    '-' +
                                                                    index +
                                                                    '-' +
                                                                    childIndex
                                                                    ? 'text-primary'
                                                                    : '-rotate-90',
                                                            ]"
                                                        />
                                                    </button>

                                                    <ul
                                                        v-show="
                                                            openSubmenu ===
                                                            groupIndex +
                                                                '-' +
                                                                index +
                                                                '-' +
                                                                childIndex
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
                                                                @click="
                                                                    isHovered = false
                                                                "
                                                                :class="[
                                                                    'menu-dropdown-item py-1 text-xs',
                                                                    isActive(
                                                                        grandChild.route,
                                                                    )
                                                                        ? 'text-primary'
                                                                        : 'text-secondary',
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
            </template>
        </div>
    </aside>
</template>
