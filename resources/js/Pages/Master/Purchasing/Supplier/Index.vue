<script setup>
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import Breadcrumb from "@/Components/Page/Breadcrumb.vue";
import DataTable from "@/Components/Table/DataTable.vue";
import Pagination from "@/Components/Table/Pagination.vue";
import TableAction from "@/Components/Table/TableAction.vue";
import TableEmpty from "@/Components/Table/TableEmpty.vue";
import TableLoading from "@/Components/Table/TableLoading.vue";

import FormInput from "@/Components/Form/FormInput.vue";
import FormCheckbox from "@/Components/Form/FormCheckbox.vue";
import FormSelect from "@/Components/Form/FormSelect.vue";
import FormTextarea from "@/Components/Form/FormTextarea.vue";

import Modal from "@/Components/Modal/Modal.vue";
import ConfirmModal from "@/Components/Modal/ConfirmModal.vue";

import PrimaryButton from "@/Components/Button/PrimaryButton.vue";
import StatusBadge from "@/Components/Badge/StatusBadge.vue";

import useCrud from "@/Composables/useCrud";
import useTable from "@/Composables/useTable";

import { computed } from "vue";

const props = defineProps({
    suppliers: Object,
    categories: Array,
    paymentTerms: Array,
    currencies: Array,
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

        supplier_category_id: "",
        payment_term_id: "",
        currency_id: "",

        phone: "",
        email: "",
        pic_name: "",

        address: "",
        city: "",

        tax_number: "",
        credit_limit: 0,

        description: "",

        is_active: true,
    },

    storeRoute: "/mst_prc_supplier",
    updateRoute: "/mst_prc_supplier",
    deleteRoute: "/mst_prc_supplier",

    deleteMessage: "Hapus supplier ini?",
});

const categoryOptions = computed(() =>
    (props.categories || []).map((item) => ({
        label: item.name,
        value: item.id,
    })),
);

const paymentTermOptions = computed(() =>
    (props.paymentTerms || []).map((item) => ({
        label: item.name,
        value: item.id,
    })),
);

const currencyOptions = computed(() =>
    (props.currencies || []).map((item) => ({
        label: item.name,
        value: item.id,
    })),
);

const { search, entries } = useTable({
    route: "/mst_prc_supplier",
    search: props.filters?.search ?? "",
    entries: props.filters?.entries ?? 10,
});
</script>

<template>
    <AppLayout>
        <Breadcrumb
            pageTitle="Supplier"
            :crumbs="['Master Data', 'Purchasing']"
        />

        <DataTable
            :headers="[
                'Code',
                'Supplier Name',
                'Category',
                'Payment Term',
                'Currency',
                'Phone',
                'Status',
                'Action',
            ]"
            :from="suppliers.from"
            :to="suppliers.to"
            :total="suppliers.total"
            :search="search"
            :entries="entries"
            @search="search = $event"
            @update:entries="entries = $event"
        >
            <!-- TOP ACTION -->
            <template #top-actions>
                <PrimaryButton @click="openCreate" size="sm">
                    Tambah Supplier
                </PrimaryButton>
            </template>

            <!-- LOADING -->
            <TableLoading v-if="loading" :rows="5" :cols="8" />

            <!-- TABLE BODY -->
            <tr
                v-else
                v-for="supplier in suppliers.data"
                :key="supplier.id"
                class="border-b border-stroke dark:border-strokedark"
            >
                <!-- CODE -->
                <td class="px-4 py-4 text-center">
                    {{ supplier.code }}
                </td>

                <!-- NAME -->
                <td class="px-4 py-4">
                    {{ supplier.name }}
                </td>

                <!-- CATEGORY -->
                <td class="px-4 py-4 text-center">
                    {{ supplier.category?.name }}
                </td>

                <!-- PAYMENT TERM -->
                <td class="px-4 py-4 text-center">
                    {{ supplier.payment_term?.name }}
                </td>

                <!-- CURRENCY -->
                <td class="px-4 py-4 text-center">
                    {{ supplier.currency?.name }}
                </td>

                <!-- PHONE -->
                <td class="px-4 py-4 text-center">
                    {{ supplier.phone }}
                </td>

                <!-- STATUS -->
                <td class="px-4 py-4 text-center">
                    <StatusBadge :active="supplier.is_active" />
                </td>

                <!-- ACTION -->
                <td class="px-4 py-4 text-center">
                    <TableAction
                        @edit="openEdit(supplier)"
                        @delete="openDelete(supplier.id)"
                    />
                </td>
            </tr>

            <!-- EMPTY -->
            <TableEmpty
                v-if="!loading && suppliers.data.length === 0"
                :colspan="8"
            />

            <!-- PAGINATION -->
            <template #pagination>
                <Pagination :links="suppliers.links" />
            </template>
        </DataTable>

        <!-- MODAL -->
        <Modal
            :show="showModal"
            :title="isEdit ? 'Edit Supplier' : 'Tambah Supplier'"
            @close="closeModal"
        >
            <div class="flex flex-col gap-4 p-6">
                <!-- CODE -->
                <FormInput
                    label="Code"
                    v-model="form.code"
                    :error="form.errors.code"
                    :disabled="isEdit"
                />

                <!-- NAME -->
                <FormInput
                    label="Supplier Name"
                    v-model="form.name"
                    :error="form.errors.name"
                />

                <!-- CATEGORY -->
                <FormSelect
                    label="Supplier Category"
                    v-model="form.supplier_category_id"
                    :options="categoryOptions"
                    :error="form.errors.supplier_category_id"
                />

                <!-- PAYMENT TERM -->
                <FormSelect
                    label="Payment Term"
                    v-model="form.payment_term_id"
                    :options="paymentTermOptions"
                    :error="form.errors.payment_term_id"
                />

                <!-- CURRENCY -->
                <FormSelect
                    label="Currency"
                    v-model="form.currency_id"
                    :options="currencyOptions"
                    :error="form.errors.currency_id"
                />

                <!-- PHONE -->
                <FormInput
                    label="Phone"
                    v-model="form.phone"
                    :error="form.errors.phone"
                />

                <!-- EMAIL -->
                <FormInput
                    label="Email"
                    v-model="form.email"
                    :error="form.errors.email"
                />

                <!-- PIC -->
                <FormInput
                    label="PIC Name"
                    v-model="form.pic_name"
                    :error="form.errors.pic_name"
                />

                <!-- CITY -->
                <FormInput
                    label="City"
                    v-model="form.city"
                    :error="form.errors.city"
                />

                <!-- TAX -->
                <FormInput
                    label="NPWP"
                    v-model="form.tax_number"
                    :error="form.errors.tax_number"
                />

                <!-- CREDIT LIMIT -->
                <FormInput
                    label="Credit Limit"
                    type="number"
                    v-model="form.credit_limit"
                    :error="form.errors.credit_limit"
                />

                <!-- ADDRESS -->
                <FormTextarea
                    label="Address"
                    v-model="form.address"
                    :error="form.errors.address"
                />

                <!-- DESCRIPTION -->
                <FormTextarea
                    label="Description"
                    v-model="form.description"
                    :error="form.errors.description"
                />

                <!-- STATUS -->
                <FormCheckbox label="Active" v-model="form.is_active" />
            </div>

            <!-- FOOTER -->
            <template #footer>
                <div class="flex items-center justify-end gap-3 p-6">
                    <button
                        @click="closeModal"
                        class="px-4 py-2 text-black dark:text-white"
                    >
                        Cancel
                    </button>

                    <PrimaryButton @click="submit" :disabled="loading">
                        {{ loading ? "Saving..." : "Simpan" }}
                    </PrimaryButton>
                </div>
            </template>
        </Modal>

        <!-- DELETE MODAL -->
        <ConfirmModal
            :show="showDeleteModal"
            @close="closeDeleteModal"
            @confirm="confirmDelete"
        />
    </AppLayout>
</template>
