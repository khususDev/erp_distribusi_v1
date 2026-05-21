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
    customers: Object,
    areas: Array,
    categories: Array,
    paymentTerms: Array,
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
        customer_category_id: "",
        sales_area_id: "",

        phone: "",
        email: "",
        address: "",

        pic_name: "",
        tax_number: "",

        payment_term_id: "",
        credit_limit: 0,

        is_active: true,
    },

    storeRoute: "/mst_sls_customer",
    updateRoute: "/mst_sls_customer",
    deleteRoute: "/mst_sls_customer",

    deleteMessage: "Hapus customer ini?",
});

const areaOptions = computed(() =>
    props.areas.map((item) => ({
        label: item.name,
        value: item.id,
    })),
);

const categoryOptions = computed(() =>
    props.categories.map((item) => ({
        label: item.name,
        value: item.id,
    })),
);

const paymentTermOptions = computed(() =>
    props.paymentTerms.map((item) => ({
        label: item.name,
        value: item.id,
    })),
);

const { search, entries } = useTable({
    route: "/mst_sls_customer",
    search: props.filters?.search ?? "",
    entries: props.filters?.entries ?? 10,
});
</script>

<template>
    <AppLayout>
        <Breadcrumb pageTitle="Customer" :crumbs="['Master Data', 'Sales']" />

        <DataTable
            :headers="[
                'Code',
                'Customer Name',
                'Category',
                'Area',
                'Phone',
                'Status',
                'Action',
            ]"
            :from="customers.from"
            :to="customers.to"
            :total="customers.total"
            :search="search"
            :entries="entries"
            @search="search = $event"
            @update:entries="entries = $event"
        >
            <template #top-actions>
                <PrimaryButton @click="openCreate" size="sm">
                    Tambah Customer
                </PrimaryButton>
            </template>

            <TableLoading v-if="loading" :rows="5" :cols="7" />

            <tr
                v-else
                v-for="customer in customers.data"
                :key="customer.id"
                class="border-b border-stroke dark:border-strokedark"
            >
                <td class="px-4 py-4 text-center">
                    {{ customer.code }}
                </td>

                <td class="px-4 py-4">
                    {{ customer.name }}
                </td>

                <td class="px-4 py-4 text-center">
                    {{ customer.category?.name }}
                </td>

                <td class="px-4 py-4 text-center">
                    {{ customer.salesArea?.name }}
                </td>

                <td class="px-4 py-4 text-center">
                    {{ customer.phone }}
                </td>

                <td class="px-4 py-4 text-center">
                    <StatusBadge :active="customer.is_active" />
                </td>

                <td class="px-4 py-4 text-center">
                    <TableAction
                        @edit="openEdit(customer)"
                        @delete="openDelete(customer.id)"
                    />
                </td>
            </tr>

            <TableEmpty
                v-if="!loading && customers.data.length === 0"
                :colspan="7"
            />

            <template #pagination>
                <Pagination :links="customers.links" />
            </template>
        </DataTable>

        <!-- MODAL -->
        <Modal
            :show="showModal"
            :title="isEdit ? 'Edit Customer' : 'Tambah Customer'"
            @close="closeModal"
        >
            <div class="flex flex-col gap-4 p-6">
                <FormInput
                    label="Code"
                    v-model="form.code"
                    :error="form.errors.code"
                    :disabled="isEdit"
                />

                <FormInput
                    label="Customer Name"
                    v-model="form.name"
                    :error="form.errors.name"
                />

                <FormSelect
                    label="Customer Category"
                    v-model="form.customer_category_id"
                    :options="categoryOptions"
                    :error="form.errors.customer_category_id"
                />

                <FormSelect
                    label="Sales Area"
                    v-model="form.sales_area_id"
                    :options="areaOptions"
                    :error="form.errors.sales_area_id"
                />

                <FormInput
                    label="Phone"
                    v-model="form.phone"
                    :error="form.errors.phone"
                />

                <FormInput
                    label="Email"
                    v-model="form.email"
                    :error="form.errors.email"
                />

                <FormInput
                    label="PIC Name"
                    v-model="form.pic_name"
                    :error="form.errors.pic_name"
                />

                <FormInput
                    label="NPWP"
                    v-model="form.tax_number"
                    :error="form.errors.tax_number"
                />

                <FormSelect
                    label="Payment Term"
                    v-model="form.payment_term_id"
                    :options="paymentTermOptions"
                    :error="form.errors.payment_term_id"
                />

                <FormInput
                    label="Credit Limit"
                    type="number"
                    v-model="form.credit_limit"
                    :error="form.errors.credit_limit"
                />

                <FormTextarea
                    label="Address"
                    v-model="form.address"
                    :error="form.errors.address"
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

                    <PrimaryButton @click="submit" :disabled="loading">
                        {{ loading ? "Saving..." : "Simpan" }}
                    </PrimaryButton>
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
