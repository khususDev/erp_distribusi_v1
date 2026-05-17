<script setup>
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import Breadcrumb from "@/Components/Page/Breadcrumb.vue"; // Pastikan path benar
import DataTable from "@/Components/Table/DataTable.vue";
import Pagination from "@/Components/Table/Pagination.vue";
import TableAction from "@/Components/Table/TableAction.vue";
import TableEmpty from "@/Components/Table/TableEmpty.vue";
import TableLoading from "@/Components/Table/TableLoading.vue";
import FormInput from "@/Components/Form/FormInput.vue";
import FormCheckbox from "@/Components/Form/FormCheckbox.vue";
import Modal from "@/Components/Modal/Modal.vue";
import PrimaryButton from "@/Components/Button/PrimaryButton.vue";
import StatusBadge from "@/Components/Badge/StatusBadge.vue";
import useCrud from "@/Composables/useCrud";
import ConfirmModal from "@/Components/Modal/ConfirmModal.vue";
import useTable from "@/Composables/useTable";
import FilterSelect from "@/Components/Filter/FilterSelect.vue";

const props = defineProps({
    brands: Object,
    filters: Object,
});

const {
    form,
    showModal,
    showDeleteModal,
    isEdit,
    loading,
    openCreate,
    openEdit,
    submit,
    openDelete,
    closeDeleteModal,
    confirmDelete,
    closeModal,
} = useCrud({
    initialForm: {
        code: "",
        name: "",
        description: "",
        is_active: true,
    },
    storeRoute: "/mst_inv_brand",
    updateRoute: "/mst_inv_brand",
    deleteRoute: "/mst_inv_brand",
    deleteMessage: "Hapus brand ini?",
});

const { search, entries, filters } = useTable({
    route: "/mst_inv_brand",
    search: props.filters?.search ?? "",
    entries: props.filters?.entries ?? 10,
    filters: { status: props.filters?.status ?? "" },
});
</script>

<template>
    <AppLayout>
        <!-- Sesuaikan Halaman -->
        <Breadcrumb pageTitle="Brand" :crumbs="['Master Data', 'Inventory']" />
        <DataTable
            :headers="['Brand Name', 'Code', 'Description', 'Status', 'Action']"
            :from="brands.from"
            :to="brands.to"
            :total="brands.total"
            :search="search"
            :entries="entries"
            @search="search = $event"
            @update:entries="entries = $event"
        >
            <!-- SLOT ATAS: UNTUK TOMBOL AKSI -->
            <template #top-actions>
                <PrimaryButton @click="openCreate" size="sm">
                    Tambah Brand
                </PrimaryButton>
                <div class="h-6 w-px bg-stroke dark:bg-strokedark mx-1"></div>
                <PrimaryButton size="sm" class="!bg-slate-500"
                    >Import</PrimaryButton
                >
                <PrimaryButton size="sm" class="!bg-slate-500"
                    >Export</PrimaryButton
                >
            </template>

            <!-- SLOT KANAN: UNTUK FILTER -->
            <!-- <template #right-actions>
                <FilterSelect
                    v-model="filters.status"
                    class="w-40"
                    placeholder="Semua Status"
                    :options="[
                        { label: 'Active', value: 1 },
                        { label: 'Inactive', value: 0 },
                    ]"
                />
            </template> -->

            <!-- TABLE BODY -->
            <TableLoading v-if="loading" :rows="5" :cols="5" />

            <tr
                v-else
                v-for="brand in brands.data"
                :key="brand.id"
                class="border-b border-stroke dark:border-strokedark"
            >
                <td
                    class="border-r border-stroke px-4 py-5 text-center last:border-r-0 dark:border-strokedark"
                >
                    <h5 class="font-medium text-black dark:text-white">
                        {{ brand.name }}
                    </h5>
                </td>

                <td
                    class="border-r border-stroke px-4 py-5 text-center last:border-r-0 dark:border-strokedark"
                >
                    <h5 class="font-medium text-black dark:text-white">
                        {{ brand.code }}
                    </h5>
                </td>

                <td
                    class="border-r border-stroke px-4 py-5 text-center text-black last:border-r-0 dark:border-strokedark dark:text-white"
                >
                    {{ brand.description ?? "-" }}
                </td>

                <td
                    class="border-r border-stroke px-4 py-5 text-center last:border-r-0 dark:border-strokedark"
                >
                    <StatusBadge :active="brand.is_active" />
                </td>

                <td
                    class="border-r border-stroke px-4 py-5 text-center last:border-r-0 dark:border-strokedark"
                >
                    <TableAction
                        @edit="openEdit(brand)"
                        @delete="openDelete(brand.id)"
                    />
                </td>
            </tr>

            <TableEmpty
                v-if="!loading && brands.data.length === 0"
                :colspan="6"
            />

            <template #pagination>
                <Pagination :links="brands.links" />
            </template>
        </DataTable>

        <!-- MODALS (Tetap Sama) -->
        <Modal
            :show="showModal"
            :title="isEdit ? 'Edit Brand' : 'Tambah Brand'"
            @close="closeModal"
        >
            <!-- ... isi form modal Anda ... -->
            <div class="p-6 flex flex-col gap-4">
                <FormInput
                    label="Brand Name"
                    v-model="form.name"
                    :error="form.errors.name"
                />
                <FormInput
                    label="Code"
                    v-model="form.code"
                    :error="form.errors.code"
                    :disabled="isEdit"
                />
                <FormInput
                    label="Description"
                    v-model="form.description"
                    :error="form.errors.description"
                />
                <FormCheckbox label="Active" v-model="form.is_active" />
            </div>
            <template #footer>
                <div class="flex items-center justify-end gap-3 p-6">
                    <button
                        @click="closeModal"
                        class="px-4 py-2 text-black dark:text-white"
                    >
                        Cancel
                    </button>
                    <PrimaryButton @click="submit" :disabled="loading">{{
                        loading ? "Saving..." : "Simpan"
                    }}</PrimaryButton>
                </div>
            </template>
        </Modal>

        <ConfirmModal
            :show="showDeleteModal"
            @close="closeDeleteModal"
            @confirm="confirmDelete"
        />
    </AppLayout>
</template>
