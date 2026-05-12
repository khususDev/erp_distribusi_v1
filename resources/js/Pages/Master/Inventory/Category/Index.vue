<script setup>
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import { ref } from "vue";
import { router } from "@inertiajs/vue3";

const props = defineProps({
    categories: Array,
});

const showModal = ref(false);
const isEdit = ref(false);

const form = ref({
    id: null,
    name: "",
    code: "",
    description: "",
    is_active: true,
});

const openCreate = () => {
    isEdit.value = false;
    form.value = {
        id: null,
        name: "",
        code: "",
        description: "",
        is_active: true,
    };
    showModal.value = true;
};

const openEdit = (category) => {
    isEdit.value = true;
    form.value = { ...category };
    showModal.value = true;
};

const close = () => {
    showModal.value = false;
};

const submit = () => {
    if (isEdit.value) {
        router.put(`/mst_inv_category/${form.value.id}`, form.value, {
            onSuccess: () => (showModal.value = false),
        });
    } else {
        router.post("/mst_inv_category", form.value, {
            onSuccess: () => (showModal.value = false),
        });
    }
};

const destroy = (category) => {
    if (confirm(`Hapus Category "${category.name}" ?`)) {
        router.delete(`/mst_inv_category/${category.id}`);
    }
};
</script>

<template>
    <AppLayout>
        <div class="section-body">
            <div class="card">
                <div class="card-header">
                    <button class="btn btn-primary" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Kategori
                    </button>
                </div>

                <div class="card-body p-0">
                    <table class="table table-striped mb-0">
                        <thead class="thead-light">
                            <tr>
                                <th>Nama</th>
                                <th>Code</th>
                                <th>Deskripsi</th>
                                <th>Status</th>
                                <th width="150">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr
                                v-for="category in categories"
                                :key="category.id"
                            >
                                <td>{{ category.name }}</td>
                                <td>{{ category.code }}</td>
                                <td>{{ category.description ?? "-" }}</td>
                                <td>
                                    <span
                                        v-if="category.is_active"
                                        class="badge badge-success"
                                    >
                                        Aktif
                                    </span>
                                    <span v-else class="badge badge-danger">
                                        Nonaktif
                                    </span>
                                </td>
                                <td>
                                    <button
                                        class="btn btn-sm btn-warning mr-1"
                                        @click="openEdit(category)"
                                    >
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button
                                        class="btn btn-sm btn-danger"
                                        @click="destroy(category)"
                                    >
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>

                            <tr v-if="categories.length === 0">
                                <td colspan="5" class="text-center text-muted">
                                    Data kategori belum tersedia
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- MODAL -->
            <div class="modal fade show d-block" v-if="showModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">
                                {{ isEdit ? "Edit" : "Tambah" }} Kategori Produk
                            </h5>
                            <button class="close" @click="close">
                                <span>&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            <div class="form-group">
                                <label>Nama</label>
                                <input
                                    v-model="form.name"
                                    class="form-control"
                                />
                            </div>

                            <div class="form-group">
                                <label>Code</label>
                                <input
                                    v-model="form.code"
                                    class="form-control"
                                    :disabled="isEdit"
                                />
                            </div>

                            <div class="form-group">
                                <label>Deskripsi</label>
                                <textarea
                                    v-model="form.description"
                                    class="form-control"
                                ></textarea>
                            </div>

                            <div class="form-check">
                                <input
                                    type="checkbox"
                                    v-model="form.is_active"
                                    class="form-check-input"
                                />
                                <label class="form-check-label">Aktif</label>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button class="btn btn-secondary" @click="close">
                                Batal
                            </button>
                            <button class="btn btn-primary" @click="submit">
                                Simpan
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
