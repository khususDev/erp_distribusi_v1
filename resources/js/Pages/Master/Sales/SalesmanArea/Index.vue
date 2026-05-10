<script setup>
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import { ref } from "vue";
import { router } from "@inertiajs/vue3";

const props = defineProps({
    data: Array,
    salesmen: Array,
    areas: Array,
});

const showModal = ref(false);

const form = ref({
    id: null,
    salesman_id: "",
    sales_area_id: "",
});

function openCreate() {
    form.value = {
        id: null,
        salesman_id: "",
        sales_area_id: "",
    };
    showModal.value = true;
}

function submit() {
    router.post("/mst_salesman_area", form.value, {
        onSuccess: () => (showModal.value = false),
    });
}

function destroy(d) {
    if (confirm("Nonaktifkan mapping ini?")) {
        router.delete(`/mst_salesman_area/${d.id}`);
    }
}
</script>

<template>
    <AppLayout>
        <section class="section">
            <div class="card">
                <div class="card-header d-flex justify-content-between p-2">
                    <h6 class="mb-0">Mapping Salesman Area</h6>
                    <button class="btn btn-primary btn-sm" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Mapping
                    </button>
                </div>

                <div class="card-body p-0">
                    <table class="table table-striped mb-0">
                        <thead>
                            <tr>
                                <th>Salesman</th>
                                <th>Sales Area</th>
                                <th>Status</th>
                                <th width="100">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="d in data" :key="d.id">
                                <td>{{ d.salesman.name }}</td>
                                <td>{{ d.area.name }}</td>
                                <td>
                                    <span
                                        :class="
                                            d.is_active
                                                ? 'badge badge-success'
                                                : 'badge badge-danger'
                                        "
                                    >
                                        {{ d.is_active ? "Aktif" : "Nonaktif" }}
                                    </span>
                                </td>
                                <td>
                                    <button
                                        class="btn btn-sm btn-danger"
                                        @click="destroy(d)"
                                    >
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>

                            <tr v-if="data.length === 0">
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
                        <h5>Tambah Mapping</h5>
                        <button class="close" @click="showModal = false">
                            &times;
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Salesman</label>
                            <select
                                v-model="form.salesman_id"
                                class="form-control"
                            >
                                <option value="">- pilih -</option>
                                <option
                                    v-for="s in salesmen"
                                    :key="s.id"
                                    :value="s.id"
                                >
                                    {{ s.name }}
                                </option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Sales Area</label>
                            <select
                                v-model="form.sales_area_id"
                                class="form-control"
                            >
                                <option value="">- pilih -</option>
                                <option
                                    v-for="a in areas"
                                    :key="a.id"
                                    :value="a.id"
                                >
                                    {{ a.name }}
                                </option>
                            </select>
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
