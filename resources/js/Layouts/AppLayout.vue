<template>
    <div id="app">
        <div class="main-wrapper">
            <!-- Navbar -->
            <div class="navbar-bg"></div>
            <nav class="navbar navbar-expand-lg main-navbar">
                <div class="mr-auto">
                    <!-- TOGGLE SIDEBAR (VUE SAFE) -->
                    <a
                        href="#"
                        class="nav-link nav-link-lg"
                        @click.prevent="toggleSidebar"
                    >
                        <i class="fas fa-bars"></i>
                    </a>
                </div>
            </nav>

            <!-- Sidebar -->
            <div class="main-sidebar">
                <aside id="sidebar-wrapper">
                    <div class="sidebar-brand">
                        <a href="#">ERP DISTRIBUSI</a>
                    </div>

                    <ul class="sidebar-menu">
                        <li class="menu-header">Menu</li>

                        <li
                            v-for="menu in menus"
                            :key="menu.id"
                            :class="[
                                menu.children?.length ? 'dropdown' : '',
                                isActiveParent(menu) ? 'active' : '',
                            ]"
                        >
                            <!-- 🔹 MENU TANPA CHILD -->
                            <a
                                v-if="
                                    !menu.children || menu.children.length === 0
                                "
                                :href="route(menu.route)"
                                class="nav-link"
                            >
                                <i :class="menu.icon"></i>
                                <span>{{ menu.name }}</span>
                            </a>

                            <!-- 🔹 MENU DENGAN CHILD -->
                            <a
                                v-else
                                href="#"
                                class="nav-link has-dropdown"
                                @click.prevent="toggleMenu(menu.id)"
                            >
                                <i :class="menu.icon"></i>
                                <span>{{ menu.name }}</span>
                            </a>

                            <!-- 🔹 SUB MENU -->
                            <ul
                                v-if="menu.children?.length"
                                class="dropdown-menu"
                                :style="{
                                    display:
                                        openedMenu === menu.id
                                            ? 'block'
                                            : 'none',
                                }"
                            >
                                <li
                                    v-for="child in menu.children"
                                    :key="child.id"
                                    :class="{ active: isActive(child) }"
                                >
                                    <a
                                        :href="route(child.route)"
                                        class="nav-link"
                                    >
                                        {{ child.name }}
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </aside>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <section class="section">
                    <slot />
                </section>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, watch, onMounted } from "vue";
import { usePage } from "@inertiajs/vue3";

const page = usePage();
const menus = page.props.menus;
const openedMenu = ref(null);
const isSidebarMini = ref(false);

// toggle manual (navbar)
const toggleSidebar = () => {
    isSidebarMini.value = !isSidebarMini.value;
    document.body.classList.toggle("sidebar-mini", isSidebarMini.value);
};

// sync dari database (is_sidebar)
watch(
    () => page.props.activeMenu,
    (menu) => {
        if (!menu) return;

        isSidebarMini.value = menu.is_sidebar === 0;
        document.body.classList.toggle("sidebar-mini", isSidebarMini.value);

        menus.forEach((parent) => {
            if (parent.children?.some((child) => child.id === menu.id)) {
                openedMenu.value = parent.id;
            }
        });
    },
    { immediate: true }
);

onMounted(() => {
    document.body.classList.toggle("sidebar-mini", isSidebarMini.value);
});

/* ===============================
   SUBMENU (BARU – AMAN)
================================ */

// toggle parent menu
const toggleMenu = (id) => {
    openedMenu.value = openedMenu.value === id ? null : id;
};

// child active?
const isActive = (menu) => {
    return page.props.activeMenu?.id === menu.id;
};

// parent active jika salah satu child aktif
const isActiveParent = (menu) => {
    return menu.children?.some(
        (child) => child.id === page.props.activeMenu?.id
    );
};
</script>
