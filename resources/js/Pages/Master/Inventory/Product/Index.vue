<script setup>
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import Breadcrumb from "@/Components/Page/Breadcrumb.vue";
import DataTable from "@/Components/Table/DataTable.vue";
import Pagination from "@/Components/Table/Pagination.vue";
import TableAction from "@/Components/Table/TableAction.vue";
import TableEmpty from "@/Components/Table/TableEmpty.vue";
import TableLoading from "@/Components/Table/TableLoading.vue";
import PrimaryButton from "@/Components/Button/PrimaryButton.vue";
import StatusBadge from "@/Components/Badge/StatusBadge.vue";
import useTable from "@/Composables/useTable";
import { router } from "@inertiajs/vue3";

const props = defineProps({
    products: Object,
    filters: Object,
});

const { search, entries } = useTable({
    route: "/mst_inv_product",
    search: props.filters?.search ?? "",
    entries: props.filters?.entries ?? 10,
});

// Navigasi ke halaman terpisah
const goToCreate = () => router.get("/mst_inv_product/create");
const goToEdit = (id) => router.get(`/mst_inv_product/${id}/edit`);
const deleteProduct = (id) => {
    if (confirm("Apakah anda yakin ingin menghapus product ini?")) {
        router.delete(`/mst_inv_product/${id}`);
    }
};
</script>

<template>
    <AppLayout>
        <Breadcrumb
            pageTitle="Products"
            :crumbs="['Master Data', 'Inventory']"
        />

        <DataTable
            :headers="[
                'SKU',
                'Product Name',
                'Category',
                'Brand',
                'Status',
                'Action',
            ]"
            :from="products.from"
            :to="products.to"
            :total="products.total"
            :search="search"
            :entries="entries"
            @search="search = $event"
            @update:entries="entries = $event"
        >
            <template #top-actions>
                <PrimaryButton @click="goToCreate" size="sm"
                    >Tambah Product</PrimaryButton
                >
                <div class="h-6 w-px bg-stroke dark:bg-strokedark mx-1"></div>
                <PrimaryButton size="sm" class="!bg-slate-500"
                    >Import</PrimaryButton
                >
                <PrimaryButton size="sm" class="!bg-slate-500"
                    >Export</PrimaryButton
                >
            </template>

            <TableLoading v-if="!products.data" :rows="5" :cols="6" />

            <tr
                v-for="product in products.data"
                :key="product.id"
                class="border-b border-stroke dark:border-strokedark"
            >
                <td class="px-4 py-5 font-medium text-black dark:text-white">
                    {{ product.sku }}
                </td>
                <td class="px-4 py-5 font-medium text-black dark:text-white">
                    {{ product.name }}
                </td>
                <td class="px-4 py-5 text-black dark:text-white">
                    {{ product.category?.name ?? "-" }}
                </td>
                <td class="px-4 py-5 text-black dark:text-white">
                    {{ product.brand?.name ?? "-" }}
                </td>
                <td class="px-4 py-5">
                    <StatusBadge :active="product.is_active" />
                </td>
                <td class="px-4 py-5">
                    <TableAction
                        @edit="goToEdit(product.hash_id)"
                        @delete="deleteProduct(product.hash_id)"
                    />
                </td>
            </tr>

            <TableEmpty
                v-if="products.data && products.data.length === 0"
                :colspan="7"
            />

            <template #pagination>
                <Pagination :links="products.links" />
            </template>
        </DataTable>
    </AppLayout>
</template>
