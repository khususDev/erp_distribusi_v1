<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
import { ref } from "vue";
import { router } from "@inertiajs/vue3";

const props = defineProps({
    customers: Array,
    categories: Array,
    locations: Array,
});

const showModal = ref(false);
const isEdit = ref(false);

const form = ref({
    id: null,
    code: "",
    name: "",
    customer_category_id: "",
    location_id: "",
    phone: "",
    email: "",
    address: "",
    is_active: true,
});

function openCreate() {
    isEdit.value = false;
    form.value = {
        id: null,
        code: "",
        name: "",
        customer_category_id: "",
        location_id: "",
        phone: "",
        email: "",
        address: "",
        is_active: true,
    };
    showModal.value = true;
}

function openEdit(c) {
    isEdit.value = true;
    form.value = { ...c };
    showModal.value = true;
}

function submit() {
    if (isEdit.value) {
        router.put(`/mst_sales_customer/${form.value.id}`, form.value, {
            onSuccess: () => (showModal.value = false),
        });
    } else {
        router.post("/mst_sales_customer", form.value, {
            onSuccess: () => (showModal.value = false),
        });
    }
}

function destroy(c) {
    if (confirm(`Nonaktifkan customer "${c.name}" ?`)) {
        router.delete(`/mst_sales_customer/${c.id}`);
    }
}
</script>

<template>
    <AppLayout>
        <section class="section">
            <div class="card">
                <!-- HEADER -->
                <div class="card-header d-flex justify-content-between p-2">
                    <h6 class="mb-0">Master Customer</h6>
                    <button class="btn btn-primary btn-sm" @click="openCreate">
                        <i class="fas fa-plus"></i> Tambah Customer
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
                                    <th>Kategori</th>
                                    <th>Lokasi</th>
                                    <th>Status</th>
                                    <th width="120">Aksi</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr v-for="c in customers" :key="c.id">
                                    <td>{{ c.code }}</td>
                                    <td>{{ c.name }}</td>
                                    <td>{{ c.category?.name }}</td>
                                    <td>{{ c.location?.name ?? "-" }}</td>
                                    <td>
                                        <span
                                            :class="
                                                c.is_active
                                                    ? 'badge badge-success'
                                                    : 'badge badge-danger'
                                            "
                                        >
                                            {{
                                                c.is_active
                                                    ? "Aktif"
                                                    : "Nonaktif"
                                            }}
                                        </span>
                                    </td>
                                    <td>
                                        <button
                                            class="btn btn-sm btn-warning mr-1"
                                            @click="openEdit(c)"
                                        >
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button
                                            class="btn btn-sm btn-danger"
                                            @click="destroy(c)"
                                        >
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>

                                <tr v-if="customers.length === 0">
                                    <td
                                        colspan="6"
                                        class="text-center text-muted"
                                    >
                                        Data customer belum tersedia
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
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>
                            {{ isEdit ? "Edit Customer" : "Tambah Customer" }}
                        </h5>
                        <button class="close" @click="showModal = false">
                            &times;
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="form-row">
                            <div class="form-group col">
                                <label>Kode</label>
                                <input
                                    class="form-control"
                                    v-model="form.code"
                                    :disabled="isEdit"
                                />
                            </div>

                            <div class="form-group col">
                                <label>Nama</label>
                                <input
                                    class="form-control"
                                    v-model="form.name"
                                />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col">
                                <label>Kategori</label>
                                <select
                                    v-model="form.customer_category_id"
                                    class="form-control"
                                >
                                    <option value="">- pilih -</option>
                                    <option
                                        v-for="c in categories"
                                        :key="c.id"
                                        :value="c.id"
                                    >
                                        {{ c.name }}
                                    </option>
                                </select>
                            </div>

                            <div class="form-group col">
                                <label>Lokasi</label>
                                <select
                                    v-model="form.location_id"
                                    class="form-control"
                                >
                                    <option value="">- pilih -</option>
                                    <option
                                        v-for="l in locations"
                                        :key="l.id"
                                        :value="l.id"
                                    >
                                        {{ l.name }}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Alamat</label>
                            <textarea
                                class="form-control"
                                v-model="form.address"
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
