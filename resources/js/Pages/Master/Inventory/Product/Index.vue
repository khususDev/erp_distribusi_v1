<script setup>
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import { router } from "@inertiajs/vue3";

defineProps({
    products: Array,
});

const goCreate = () => {
    router.visit("/mst_inv_product/create");
};

const goEdit = (id) => {
    router.visit(`/mst_inv_product/${id}/edit`);
};
</script>

<template>
    <AppLayout>
        <section class="section">
            <div class="card">
                <!-- HEADER -->
                <div
                    class="card-header d-flex justify-content-between align-items-center p-2"
                >
                    <h6 class="mb-0">Master Product</h6>

                    <button class="btn btn-primary btn-sm" @click="goCreate">
                        <i class="fas fa-plus"></i> Tambah Product
                    </button>
                </div>

                <!-- BODY -->
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped mb-0">
                            <thead>
                                <tr>
                                    <th>Kode</th>
                                    <th>Nama Product</th>
                                    <th>Kategori</th>
                                    <th>Brand</th>
                                    <th>Status</th>
                                    <th width="120">Aksi</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr
                                    v-for="product in products"
                                    :key="product.id"
                                >
                                    <td>
                                        <strong>{{ product.code }}</strong>
                                    </td>
                                    <td>{{ product.name }}</td>
                                    <td>
                                        {{ product.category?.name ?? "-" }}
                                    </td>
                                    <td>
                                        {{ product.brand?.name ?? "-" }}
                                    </td>
                                    <td>
                                        <span
                                            :class="
                                                product.is_active
                                                    ? 'badge badge-success'
                                                    : 'badge badge-danger'
                                            "
                                        >
                                            {{
                                                product.is_active
                                                    ? "Aktif"
                                                    : "Nonaktif"
                                            }}
                                        </span>
                                    </td>
                                    <td>
                                        <button
                                            class="btn btn-sm btn-warning"
                                            @click="goEdit(product.id)"
                                        >
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>

                                <tr v-if="products.length === 0">
                                    <td
                                        colspan="6"
                                        class="text-center text-muted"
                                    >
                                        Data product belum tersedia
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </AppLayout>
</template>
