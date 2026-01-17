<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
import { ref } from "vue";
import { router } from "@inertiajs/vue3";

defineProps({
    departments: Array,
});

const showModal = ref(false);
const isEdit = ref(false);

const form = ref({
    id: null,
    code: "",
    name: "",
    description: "",
    is_active: true,
});

function openCreate() {
    isEdit.value = false;
    form.value = {
        id: null,
        code: "",
        name: "",
        description: "",
        is_active: true,
    };
    showModal.value = true;
}

function openEdit(dep) {
    isEdit.value = true;
    form.value = { ...dep };
    showModal.value = true;
}

function submit() {
    if (isEdit.value) {
        router.put(`/mst_grl_department/${form.value.id}`, form.value, {
            onSuccess: () => (showModal.value = false),
        });
    } else {
        router.post("/mst_grl_department", form.value, {
            onSuccess: () => (showModal.value = false),
        });
    }
}

function destroy(dep) {
    if (confirm(`Hapus department "${dep.name}"?`)) {
        router.delete(`/mst_grl_department/${dep.id}`);
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
                    <h6 class="section-title">Department Master</h6>

                    <button class="btn btn-primary btn-sm" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Department
                    </button>
                </div>

                <!-- CARD BODY -->
                <div class="card-body p-0">
                    <table class="table table-striped mb-0">
                        <thead class="thead-light">
                            <tr>
                                <th>Code</th>
                                <th>Nama</th>
                                <th>Status</th>
                                <th width="120">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="dep in departments" :key="dep.id">
                                <td>{{ dep.code }}</td>
                                <td>{{ dep.name }}</td>
                                <td>
                                    <span
                                        class="badge"
                                        :class="
                                            dep.is_active
                                                ? 'badge-success'
                                                : 'badge-danger'
                                        "
                                    >
                                        {{
                                            dep.is_active ? "Aktif" : "Nonaktif"
                                        }}
                                    </span>
                                </td>
                                <td>
                                    <button
                                        class="btn btn-sm btn-warning mr-1"
                                        @click="openEdit(dep)"
                                    >
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button
                                        class="btn btn-sm btn-danger"
                                        @click="destroy(dep)"
                                    >
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>

                            <tr v-if="departments.length === 0">
                                <td colspan="4" class="text-center text-muted">
                                    Data belum tersedia
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <!-- MODAL -->
        <div
            v-if="showModal"
            class="modal fade show"
            style="display: block; background: rgba(0, 0, 0, 0.5)"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            {{ isEdit ? "Edit" : "Tambah" }} Department
                        </h5>
                        <button class="close" @click="showModal = false">
                            &times;
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Code</label>
                            <input
                                class="form-control"
                                v-model="form.code"
                                :disabled="isEdit"
                            />
                        </div>

                        <div class="form-group">
                            <label>Nama</label>
                            <input class="form-control" v-model="form.name" />
                        </div>

                        <div class="form-group">
                            <label>Deskripsi</label>
                            <textarea
                                class="form-control"
                                v-model="form.description"
                            ></textarea>
                        </div>

                        <div class="form-check">
                            <input
                                type="checkbox"
                                class="form-check-input"
                                v-model="form.is_active"
                            />
                            <label class="form-check-label">Aktif</label>
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
