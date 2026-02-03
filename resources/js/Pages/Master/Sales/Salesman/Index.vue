<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
import { ref } from "vue";
import { router } from "@inertiajs/vue3";

const props = defineProps({
    salesmens: Array,
});

const showModal = ref(false);
const isEdit = ref(false);

const form = ref({
    id: null,
    code: "",
    name: "",
    phone: "",
    email: "",
    is_active: true,
});

function openCreate() {
    isEdit.value = false;
    form.value = {
        id: null,
        code: "",
        name: "",
        phone: "",
        email: "",
        is_active: true,
    };
    showModal.value = true;
}

function openEdit(s) {
    isEdit.value = true;
    form.value = { ...s };
    showModal.value = true;
}

function submit() {
    if (isEdit.value) {
        router.put(`/mst_sales_salesman/${form.value.id}`, form.value, {
            onSuccess: () => (showModal.value = false),
        });
    } else {
        router.post("/mst_sales_salesman", form.value, {
            onSuccess: () => (showModal.value = false),
        });
    }
}

function destroy(s) {
    if (confirm(`Nonaktifkan salesman "${s.name}" ?`)) {
        router.delete(`/mst_sales_salesman/${s.id}`);
    }
}
</script>

<template>
    <AppLayout>
        <section class="section">
            <div class="card">
                <!-- HEADER -->
                <div class="card-header d-flex justify-content-between p-2">
                    <h6 class="mb-0">Master Salesman</h6>
                    <button class="btn btn-primary btn-sm" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Salesman
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
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th width="120">Aksi</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr v-for="s in salesmens" :key="s.id">
                                    <td>{{ s.code }}</td>
                                    <td>{{ s.name }}</td>
                                    <td>{{ s.phone ?? "-" }}</td>
                                    <td>{{ s.email ?? "-" }}</td>
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

                                <tr v-if="salesmens.length === 0">
                                    <td
                                        colspan="6"
                                        class="text-center text-muted"
                                    >
                                        Data salesman belum tersedia
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
                            {{ isEdit ? "Edit Salesman" : "Tambah Salesman" }}
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
                            <label>Phone</label>
                            <input class="form-control" v-model="form.phone" />
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input class="form-control" v-model="form.email" />
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
