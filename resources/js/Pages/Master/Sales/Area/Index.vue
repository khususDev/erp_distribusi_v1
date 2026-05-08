<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
import { ref } from "vue";
import { router } from "@inertiajs/vue3";

const props = defineProps({
    areas: Array,
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

function openEdit(a) {
    isEdit.value = true;
    form.value = { ...a };
    showModal.value = true;
}

function submit() {
    if (isEdit.value) {
        router.put(`/mst_sales_area/${form.value.id}`, form.value, {
            onSuccess: () => (showModal.value = false),
        });
    } else {
        router.post("/mst_sales_area", form.value, {
            onSuccess: () => (showModal.value = false),
        });
    }
}

function destroy(a) {
    if (confirm(`Nonaktifkan sales area "${a.name}" ?`)) {
        router.delete(`/mst_sales_area/${a.id}`);
    }
}
</script>

<template>
    <AppLayout>
        <section class="section">
            <div class="card">
                <!-- HEADER -->
                <div class="card-header d-flex justify-content-between p-2">
                    <h6 class="mb-0">Master Sales Area</h6>
                    <button class="btn btn-primary btn-sm" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Area
                    </button>
                </div>

                <!-- TABLE -->
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped mb-0">
                            <thead>
                                <tr>
                                    <th>Kode</th>
                                    <th>Nama</th>
                                    <th>Deskripsi</th>
                                    <th>Status</th>
                                    <th width="120">Aksi</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr v-for="a in areas" :key="a.id">
                                    <td>{{ a.code }}</td>
                                    <td>{{ a.name }}</td>
                                    <td>{{ a.description ?? "-" }}</td>
                                    <td>
                                        <span
                                            :class="
                                                a.is_active
                                                    ? 'badge badge-success'
                                                    : 'badge badge-danger'
                                            "
                                        >
                                            {{
                                                a.is_active
                                                    ? "Aktif"
                                                    : "Nonaktif"
                                            }}
                                        </span>
                                    </td>
                                    <td>
                                        <button
                                            class="btn btn-sm btn-warning mr-1"
                                            @click="openEdit(a)"
                                        >
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button
                                            class="btn btn-sm btn-danger"
                                            @click="destroy(a)"
                                        >
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>

                                <tr v-if="areas.length === 0">
                                    <td
                                        colspan="5"
                                        class="text-center text-muted"
                                    >
                                        Data sales area belum tersedia
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
            v-if="showModal"
            class="modal fade show"
            style="display: block; background: rgba(0, 0, 0, 0.5)"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>
                            {{
                                isEdit ? "Edit Sales Area" : "Tambah Sales Area"
                            }}
                        </h5>
                        <button class="close" @click="showModal = false">
                            &times;
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Kode</label>
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
