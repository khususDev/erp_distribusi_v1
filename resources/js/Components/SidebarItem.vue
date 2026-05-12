<template>
    <li :class="[{ dropdown: hasChildren }, { active: isOpen(menu.id) }]">
        <!-- SINGLE MENU -->
        <a
            v-if="!hasChildren && menu.route"
            :href="route(menu.route)"
            class="nav-link"
        >
            <i :class="menu.icon"></i>
            <span>{{ menu.name }}</span>
        </a>

        <!-- DROPDOWN -->
        <a
            v-else
            href="#"
            class="nav-link has-dropdown"
            @click.prevent="toggleMenu(menu)"
        >
            <div
                class="d-flex w-100 justify-content-between align-items-center"
            >
                <div>
                    <i :class="menu.icon"></i>
                    <span>{{ menu.name }}</span>
                </div>

                <i
                    class="fas fa-chevron-right sidebar-arrow"
                    :class="{ rotated: isOpen(menu.id) }"
                ></i>
            </div>
        </a>

        <!-- SUBMENU -->
        <transition name="submenu">
            <ul v-show="isOpen(menu.id)" class="erp-submenu open">
                <SidebarItem
                    v-for="child in menu.children"
                    :key="child.id"
                    :menu="child"
                />
            </ul>
        </transition>
    </li>
</template>

<script setup>
import { computed, inject } from "vue";
import SidebarItem from "./SidebarItem.vue";

const props = defineProps({
    menu: Object,
});

const openedMenus = inject("openedMenus");
const setOpenedMenus = inject("setOpenedMenus");

const hasChildren = computed(() => {
    return props.menu.children?.length > 0;
});

const isOpen = (id) => {
    return openedMenus.value.includes(id);
};

const toggleMenu = (menu) => {
    let current = [...openedMenus.value];

    // tutup sibling level sama
    if (menu.parent_id) {
        current = current.filter((id) => {
            return id !== menu.parent_id;
        });
    }

    if (isOpen(menu.id)) {
        current = current.filter((id) => id !== menu.id);
    } else {
        current.push(menu.id);
    }

    setOpenedMenus(current);
};
</script>
