<script setup>
import { ref } from "vue";
import { useForm } from "@inertiajs/vue3";

import AppLayout from "@/Layouts/AppLayout.vue";

const props = defineProps({
    user: Object,
    menus: Array,
    userMenuIds: Array,
});

const form = useForm({
    menu_ids: [...props.userMenuIds],
});

const toggle = (id) => {
    form.menu_ids.includes(id)
        ? form.menu_ids.splice(form.menu_ids.indexOf(id), 1)
        : form.menu_ids.push(id);
};

const submit = () => {
    form.post(route("mng_menupermission.update", props.user.id));
};
</script>

<template>
    <AppLayout>
        <div class="section">
            <div class="card">
                <!-- CARD HEADER -->
                <div
                    class="card-header d-flex justify-content-between align-items-center p-1 pl-3 pr-3"
                >
                    <h6 class="section-title">
                        Menu Permission - {{ user.name }}
                    </h6>
                </div>

                <!-- CARD BODY -->
                <div class="card-body">
                    <form @submit.prevent="submit">
                        <ul class="list-unstyled">
                            <li v-for="menu in menus" :key="menu.id">
                                <label>
                                    <input
                                        type="checkbox"
                                        :checked="
                                            form.menu_ids.includes(menu.id)
                                        "
                                        @change="toggle(menu.id)"
                                    />
                                    {{ menu.name }}
                                </label>

                                <ul v-if="menu.children.length" class="ml-4">
                                    <li
                                        v-for="child in menu.children"
                                        :key="child.id"
                                    >
                                        <label>
                                            <input
                                                type="checkbox"
                                                :checked="
                                                    form.menu_ids.includes(
                                                        child.id,
                                                    )
                                                "
                                                @change="toggle(child.id)"
                                            />
                                            {{ child.name }}
                                        </label>
                                    </li>
                                </ul>
                            </li>
                        </ul>

                        <button class="btn btn-success mt-3">Simpan</button>
                    </form>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
