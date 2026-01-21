<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
import { ref } from "vue";
import { router, usePage } from "@inertiajs/vue3";

const props = defineProps({
    locations: Array,
});

const page = usePage();

const showModal = ref(false);
const isEdit = ref(false);

const form = ref({
    id: null,
    code: "",
    name: "",
    type: "BRANCH",
    address: "",
    parent_id: null,
    is_active: true,
});

function openCreate() {
    isEdit.value = false;
    form.value = {
        id: null,
        code: "",
        name: "",
        type: "BRANCH",
        address: "",
        parent_id: null,
        is_active: true,
    };
    showModal.value = true;
}

function openEdit(location) {
    isEdit.value = true;
    form.value = { ...location };
    showModal.value = true;
}

function submit() {
    if (isEdit.value) {
        router.put(`/mst_grl_location/${form.value.id}`, form.value, {
            onSuccess: () => (showModal.value = false),
        });
    } else {
        router.post("/mst_grl_location", form.value, {
            onSuccess: () => (showModal.value = false),
        });
    }
}

function destroy(location) {
    if (confirm(`Hapus lokasi "${location.name}" ?`)) {
        router.delete(`/mst_grl_location/${location.id}`);
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
                    <h6 class="section-title">Master Location</h6>

                    <button class="btn btn-primary btn-sm" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Location
                    </button>
                </div>

                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped mb-0">
                            <thead class="thead-light">
                                <tr>
                                    <th>Kode</th>
                                    <th>Nama</th>
                                    <th>Tipe</th>
                                    <th>Status</th>
                                    <th width="150">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="location in locations"
                                    :key="location.id"
                                >
                                    <td>{{ location.code }}</td>
                                    <td>{{ location.name }}</td>
                                    <td>
                                        <span class="badge badge-info">
                                            {{ location.type }}
                                        </span>
                                    </td>
                                    <td>
                                        <span
                                            :class="
                                                location.is_active
                                                    ? 'badge badge-success'
                                                    : 'badge badge-danger'
                                            "
                                        >
                                            {{
                                                location.is_active
                                                    ? "Aktif"
                                                    : "Nonaktif"
                                            }}
                                        </span>
                                    </td>
                                    <td>
                                        <button
                                            class="btn btn-sm btn-warning mr-1"
                                            @click="openEdit(location)"
                                        >
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button
                                            class="btn btn-sm btn-danger"
                                            @click="destroy(location)"
                                        >
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>

                                <tr v-if="locations.length === 0">
                                    <td
                                        colspan="5"
                                        class="text-center text-muted"
                                    >
                                        Data location belum tersedia
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
                            {{ isEdit ? "Edit Location" : "Tambah Location" }}
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
                            <label>Tipe</label>
                            <select class="form-control" v-model="form.type">
                                <option value="BRANCH">Branch</option>
                                <option value="AREA">Area</option>
                                <option value="WAREHOUSE">Warehouse</option>
                                <option value="OFFICE">Office</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Alamat</label>
                            <textarea
                                class="form-control"
                                v-model="form.address"
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
