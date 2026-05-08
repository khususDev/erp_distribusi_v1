<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
import { ref } from "vue";
import { router } from "@inertiajs/vue3";

const props = defineProps({
    paymentTerms: Array,
});

const showModal = ref(false);
const isEdit = ref(false);

const form = ref({
    id: null,
    code: "",
    name: "",
    days: 0,
    description: "",
    is_active: true,
});

function openCreate() {
    isEdit.value = false;

    form.value = {
        id: null,
        code: "",
        name: "",
        days: 0,
        description: "",
        is_active: true,
    };

    showModal.value = true;
}

function openEdit(p) {
    isEdit.value = true;
    form.value = { ...p };
    showModal.value = true;
}

function submit() {
    if (isEdit.value) {
        router.put(`/mst_fin_payment_term/${form.value.id}`, form.value, {
            onSuccess: () => (showModal.value = false),
        });
    } else {
        router.post("/mst_fin_payment_term", form.value, {
            onSuccess: () => (showModal.value = false),
        });
    }
}

function destroy(p) {
    if (confirm(`Nonaktifkan payment term "${p.name}" ?`)) {
        router.delete(`/mst_fin_payment_term/${p.id}`);
    }
}
</script>

<template>
    <AppLayout>
        <section class="section">
            <div class="card">
                <!-- HEADER -->
                <div
                    class="card-header d-flex justify-content-between align-items-center p-1 pl-3 pr-3"
                >
                    <h6 class="section-title">Master Payment Term</h6>

                    <button class="btn btn-primary btn-sm" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Payment Term
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
                                    <th>Hari</th>
                                    <th>Deskripsi</th>
                                    <th>Status</th>
                                    <th width="120">Aksi</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr v-for="p in paymentTerms" :key="p.id">
                                    <td>{{ p.code }}</td>
                                    <td>{{ p.name }}</td>
                                    <td>{{ p.days }} Hari</td>
                                    <td>{{ p.description }}</td>

                                    <td>
                                        <span
                                            :class="
                                                p.is_active
                                                    ? 'badge badge-success'
                                                    : 'badge badge-danger'
                                            "
                                        >
                                            {{
                                                p.is_active
                                                    ? "Aktif"
                                                    : "Nonaktif"
                                            }}
                                        </span>
                                    </td>

                                    <td>
                                        <button
                                            class="btn btn-sm btn-warning mr-1"
                                            @click="openEdit(p)"
                                        >
                                            <i class="fas fa-edit"></i>
                                        </button>

                                        <button
                                            class="btn btn-sm btn-danger"
                                            @click="destroy(p)"
                                        >
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>

                                <tr v-if="paymentTerms.length === 0">
                                    <td
                                        colspan="6"
                                        class="text-center text-muted"
                                    >
                                        Data payment term belum tersedia
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
            tabindex="-1"
            style="display: block; background: rgba(0, 0, 0, 0.5)"
            v-if="showModal"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            {{
                                isEdit
                                    ? "Edit Payment Term"
                                    : "Tambah Payment Term"
                            }}
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
                            <label>Kode</label>

                            <input
                                type="text"
                                class="form-control"
                                v-model="form.code"
                                :disabled="isEdit"
                            />
                        </div>

                        <div class="form-group">
                            <label>Nama</label>

                            <input
                                type="text"
                                class="form-control"
                                v-model="form.name"
                            />
                        </div>

                        <div class="form-group">
                            <label>Jumlah Hari</label>

                            <input
                                type="number"
                                class="form-control"
                                v-model="form.days"
                            />
                        </div>

                        <div class="form-group">
                            <label>Deskripsi</label>

                            <textarea
                                class="form-control"
                                v-model="form.description"
                            ></textarea>
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input
                                type="checkbox"
                                id="is_active"
                                class="custom-control-input"
                                v-model="form.is_active"
                            />

                            <label class="custom-control-label" for="is_active">
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
