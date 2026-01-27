<template>
    <AppLayout>
        <div class="section-body">
            <div class="card">
                <div class="card-header">
                    <button class="btn btn-primary" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Company
                    </button>
                </div>

                <div class="card-body p-0">
                    <table class="table table-striped mb-0">
                        <thead class="thead-light">
                            <tr>
                                <th>Nama</th>
                                <th>Code</th>
                                <th>Email</th>
                                <th>Status</th>
                                <th width="150">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="company in companies" :key="company.id">
                                <td>{{ company.name }}</td>
                                <td>{{ company.code }}</td>
                                <td>{{ company.email ?? "-" }}</td>
                                <td>
                                    <span
                                        v-if="company.is_active"
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
                                        @click="openEdit(company)"
                                    >
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button
                                        class="btn btn-sm btn-danger"
                                        @click="destroy(company)"
                                    >
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>

                            <tr v-if="companies.length === 0">
                                <td colspan="5" class="text-center text-muted">
                                    Data company belum tersedia
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
                                {{ isEdit ? "Edit Company" : "Tambah Company" }}
                            </h5>
                            <button type="button" class="close" @click="close">
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
                                <label>Email</label>
                                <input
                                    v-model="form.email"
                                    class="form-control"
                                />
                            </div>

                            <div class="form-group">
                                <label>Phone</label>
                                <input
                                    v-model="form.phone"
                                    class="form-control"
                                />
                            </div>

                            <div class="form-group">
                                <label>Address</label>
                                <textarea
                                    v-model="form.address"
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

<script setup>
import { ref } from "vue";
import { useForm } from "@inertiajs/vue3";

const props = defineProps({
    companies: Array,
});

const showModal = ref(false);
const isEdit = ref(false);

const form = useForm({
    id: null,
    name: "",
    code: "",
    phone: "",
    email: "",
    address: "",
    is_active: true,
});

const openCreate = () => {
    isEdit.value = false;
    form.reset();
    showModal.value = true;
};

const openEdit = (company) => {
    isEdit.value = true;
    form.fill(company);
    showModal.value = true;
};

const close = () => {
    showModal.value = false;
};

const submit = () => {
    if (isEdit.value) {
        form.put(route("company.index") + "/" + form.id, {
            onSuccess: close,
        });
    } else {
        form.post(route("company.index"), {
            onSuccess: close,
        });
    }
};

const destroy = (company) => {
    if (confirm("Hapus company ini?")) {
        form.delete(route("company.index") + "/" + company.id);
    }
};
</script>
