<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
import { ref } from "vue";
import { router } from "@inertiajs/vue3";

const props = defineProps({
    categories: Array,
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
        warehouse_id: "",
        description: "",
        is_active: true,
    };
    showModal.value = true;
}

function openEdit(data) {
    isEdit.value = true;
    form.value = { ...data };
    showModal.value = true;
}

function submit() {
    if (isEdit.value) {
        router.put(
            `/mst_sales_customer_category/${form.value.id}`,
            form.value,
            {
                onSuccess: () => (showModal.value = false),
            },
        );
    } else {
        router.post("/mst_sales_customer_category", form.value, {
            onSuccess: () => (showModal.value = false),
        });
    }
}

function destroy(data) {
    if (confirm(`Nonaktifkan customer category "${data.name}" ?`)) {
        router.delete(`/mst_sales_customer_category/${data.id}`);
    }
}
</script>

<template>
    <AppLayout>
        <section class="section">
            <div class="card">
                <div class="card-header d-flex justify-content-between p-2">
                    <h6 class="mb-0">Master Customer Category</h6>
                    <button class="btn btn-primary btn-sm" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Customer Category
                    </button>
                </div>

                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped mb-0">
                            <thead>
                                <tr>
                                    <th>Kode</th>
                                    <th>Nama</th>
                                    <th>Status</th>
                                    <th width="130">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="s in categories" :key="s.id">
                                    <td>{{ s.code }}</td>
                                    <td>{{ s.name }}</td>
                                    <td>
                                        <span
                                            :class="
                                                s.is_active
                                                    ? 'badge badge-success'
                                                    : 'badge badge-danger'
                                            "
                                        >
                                            {{
                                                s.is_active
                                                    ? "Aktif"
                                                    : "Nonaktif"
                                            }}
                                        </span>
                                    </td>
                                    <td>
                                        <button
                                            class="btn btn-sm btn-warning mr-1"
                                            @click="openEdit(s)"
                                        >
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button
                                            class="btn btn-sm btn-danger"
                                            @click="destroy(s)"
                                        >
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>

                                <tr v-if="categories.length === 0">
                                    <td
                                        colspan="5"
                                        class="text-center text-muted"
                                    >
                                        Data customer category belum tersedia
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <!-- MODAL -->
        <div
            class="modal fade show"
            style="display: block; background: rgba(0, 0, 0, 0.5)"
            v-if="showModal"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            {{
                                isEdit
                                    ? "Edit Customer Category"
                                    : "Tambah Customer Category"
                            }}
                        </h5>
                        <button class="close" @click="showModal = false">
                            <span>&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Kode</label>
                            <input class="form-control" v-model="form.code" />
                        </div>

                        <div class="form-group">
                            <label>Nama</label>
                            <input class="form-control" v-model="form.name" />
                        </div>

                        <div class="form-group">
                            <label>Deskripsi</label>
                            <input
                                class="form-control"
                                v-model="form.description"
                            />
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input
                                type="checkbox"
                                class="custom-control-input"
                                id="active"
                                v-model="form.is_active"
                            />
                            <label class="custom-control-label" for="active">
                                Aktif
                            </label>
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
