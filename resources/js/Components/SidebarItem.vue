<template>
    <li :class="hasChildren ? 'dropdown' : ''">
        <!-- MENU TANPA CHILD -->
        <a
            v-if="!hasChildren && menu.route"
            :href="route(menu.route)"
            class="nav-link"
        >
            <i :class="menu.icon"></i>
            <span>{{ menu.name }}</span>
        </a>

        <!-- MENU DENGAN CHILD -->
        <a
            v-else
            href="#"
            class="nav-link has-dropdown"
            @click.prevent="toggle"
        >
            <i :class="menu.icon"></i>
            <span>{{ menu.name }}</span>
        </a>

        <!-- CHILDREN -->
        <ul v-if="hasChildren" class="erp-submenu" :class="{ open: opened }">
            <SidebarItem
                v-for="child in menu.children"
                :key="child.id"
                :menu="child"
            />
        </ul>
    </li>
</template>

<script setup>
import { ref, computed } from "vue";
import SidebarItem from "./SidebarItem.vue";

const props = defineProps({
    menu: Object,
});

const opened = ref(false);

const toggle = () => {
    opened.value = !opened.value;
};

const hasChildren = computed(() => {
    return Array.isArray(props.menu.children) && props.menu.children.length > 0;
});
</script>
