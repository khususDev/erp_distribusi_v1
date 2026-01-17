<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
import { ref } from "vue";
import { router, usePage } from "@inertiajs/vue3";

const props = defineProps({
    roles: Array,
});

const page = usePage();

const form = ref({
    id: null,
    name: "",
    code: "",
    description: "",
    is_active: true,
});

const showModal = ref(false);
const isEdit = ref(false);

function openCreate() {
    isEdit.value = false;
    form.value = {
        id: null,
        name: "",
        code: "",
        description: "",
        is_active: true,
    };
    showModal.value = true;
}

function openEdit(role) {
    isEdit.value = true;
    form.value = { ...role };
    showModal.value = true;
}

function submit() {
    if (isEdit.value) {
        router.put(`/mng_role/${form.value.id}`, form.value, {
            onSuccess: () => {
                showModal.value = false;
            },
        });
    } else {
        router.post("/mng_role", form.value, {
            onSuccess: () => {
                showModal.value = false;
            },
        });
    }
    showModal.value = false;
}

function destroy(role) {
    if (confirm(`Hapus role "${role.name}" ?`)) {
        router.delete(`/mng_role/${role.id}`, {
            preserveScroll: true,
            onError: (errors) => {
                alert(errors.role);
            },
        });
    }
}
</script>

<template>
    <AppLayout>
        <section class="section">
            <div class="card">
                <!-- CARD HEADER -->
                <div
                    class="card-header d-flex justify-content-between align-items-center p-1 pl-3 pr-3"
                >
                    <h6 class="section-title">Role Management</h6>

                    <button class="btn btn-primary btn-sm" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Role
                    </button>
                </div>

                <!-- CARD BODY -->
                <div class="card-body p-0">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>Nama</th>
                                <th>Code</th>
                                <th>Status</th>
                                <th width="150">Aksi</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr v-for="role in roles" :key="role.id">
                                <td>{{ role.name }}</td>
                                <td>{{ role.code }}</td>
                                <td>
                                    <span
                                        v-if="role.is_active"
                                        class="badge bg-success"
                                    >
                                        Aktif
                                    </span>
                                    <span v-else class="badge bg-danger">
                                        Nonaktif
                                    </span>
                                </td>
                                <td>
                                    <button
                                        class="btn btn-sm btn-warning me-1"
                                        @click="openEdit(role)"
                                    >
                                        <i class="fas fa-edit"></i>
                                    </button>

                                    <button
                                        class="btn btn-sm btn-danger"
                                        @click="destroy(role)"
                                    >
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>

                            <tr v-if="roles.length === 0">
                                <td
                                    colspan="4"
                                    class="text-center text-muted py-3"
                                >
                                    Data role belum tersedia
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <!-- MODAL -->
        <div
            class="modal fade show"
            tabindex="-1"
            style="display: block; background: rgba(0, 0, 0, 0.5)"
            v-if="showModal"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            {{ isEdit ? "Edit Role" : "Tambah Role" }}
                        </h5>
                        <button
                            type="button"
                            class="close"
                            @click="showModal = false"
                        >
                            <span>&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Nama</label>
                            <input
                                v-model="form.name"
                                type="text"
                                class="form-control"
                            />
                        </div>

                        <div class="form-group">
                            <label>Code</label>
                            <input
                                v-model="form.code"
                                type="text"
                                class="form-control"
                                :disabled="isEdit"
                            />
                        </div>

                        <div class="form-group">
                            <label>Deskripsi</label>
                            <input
                                v-model="form.description"
                                type="text"
                                class="form-control"
                            />
                        </div>

                        <div class="form-group">
                            <div class="custom-control custom-checkbox">
                                <input
                                    type="checkbox"
                                    class="custom-control-input"
                                    id="is_active"
                                    v-model="form.is_active"
                                />
                                <label
                                    class="custom-control-label"
                                    for="is_active"
                                >
                                    Aktif
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button
                            class="btn btn-secondary"
                            @click="showModal = false"
                        >
                            Batal
                        </button>
                        <button class="btn btn-primary" @click="submit">
                            Simpan
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
