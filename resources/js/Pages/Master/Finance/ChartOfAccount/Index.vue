<script setup>
import { computed } from "vue";

import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import Breadcrumb from "@/Components/Page/Breadcrumb.vue";
import DataTable from "@/Components/Table/DataTable.vue";
import Pagination from "@/Components/Table/Pagination.vue";
import TableAction from "@/Components/Table/TableAction.vue";
import TableEmpty from "@/Components/Table/TableEmpty.vue";
import TableLoading from "@/Components/Table/TableLoading.vue";

import FormInput from "@/Components/Form/FormInput.vue";
import FormSelect from "@/Components/Form/FormSelect.vue";
import FormCheckbox from "@/Components/Form/FormCheckbox.vue";
import Modal from "@/Components/Modal/Modal.vue";
import PrimaryButton from "@/Components/Button/PrimaryButton.vue";
import StatusBadge from "@/Components/Badge/StatusBadge.vue";
import ConfirmModal from "@/Components/Modal/ConfirmModal.vue";

import useCrud from "@/Composables/useCrud";
import useTable from "@/Composables/useTable";

const props = defineProps({
    accounts: Object,
    parentAccounts: Array,
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
        type: "asset",
        parent_id: "",
        level: 1,
        is_header: false,
        is_active: true,
        description: "",
    },

    storeRoute: "/mst_fin_chart_account",
    updateRoute: "/mst_fin_chart_account",
    deleteRoute: "/mst_fin_chart_account",
});

const { search, entries } = useTable({
    route: "/mst_fin_chart_account",
    search: props.filters?.search ?? "",
    entries: props.filters?.entries ?? 10,
});

const parentOptions = computed(() =>
    props.parentAccounts.map((item) => ({
        label: `${item.code} - ${item.name}`,
        value: item.id,
    })),
);

const typeOptions = [
    { label: "Asset", value: "asset" },
    { label: "Liability", value: "liability" },
    { label: "Equity", value: "equity" },
    { label: "Revenue", value: "revenue" },
    { label: "Expense", value: "expense" },
];
</script>

<template>
    <AppLayout>
        <Breadcrumb
            pageTitle="Chart Of Account"
            :crumbs="['Master Data', 'Finance']"
        />

        <DataTable
            :headers="[
                'Code',
                'Account Name',
                'Type',
                'Parent',
                'Status',
                'Action',
            ]"
            :from="accounts.from"
            :to="accounts.to"
            :total="accounts.total"
            :search="search"
            :entries="entries"
            @search="search = $event"
            @update:entries="entries = $event"
        >
            <template #top-actions>
                <PrimaryButton @click="openCreate"> Tambah COA </PrimaryButton>
            </template>

            <TableLoading v-if="loading" :rows="5" :cols="6" />

            <tr
                v-else
                v-for="account in accounts.data"
                :key="account.id"
                class="border-b border-stroke dark:border-strokedark"
            >
                <td class="px-4 py-5 text-center">
                    {{ account.code }}
                </td>

                <td class="px-4 py-5">
                    {{ account.name }}
                </td>

                <td class="px-4 py-5 text-center">
                    {{ account.type }}
                </td>

                <td class="px-4 py-5">
                    {{ account.parent?.name ?? "-" }}
                </td>

                <td class="px-4 py-5 text-center">
                    <StatusBadge :active="account.is_active" />
                </td>

                <td class="px-4 py-5 text-center">
                    <TableAction
                        @edit="openEdit(account)"
                        @delete="openDelete(account.id)"
                    />
                </td>
            </tr>

            <TableEmpty
                v-if="!loading && accounts.data.length === 0"
                :colspan="6"
            />

            <template #pagination>
                <Pagination :links="accounts.links" />
            </template>
        </DataTable>

        <!-- MODAL -->
        <Modal
            :show="showModal"
            :title="isEdit ? 'Edit COA' : 'Tambah COA'"
            @close="closeModal"
        >
            <div class="flex flex-col gap-4 p-6">
                <FormInput
                    label="Code"
                    v-model="form.code"
                    :error="form.errors.code"
                />

                <FormInput
                    label="Account Name"
                    v-model="form.name"
                    :error="form.errors.name"
                />

                <FormSelect
                    label="Type"
                    v-model="form.type"
                    :options="typeOptions"
                />

                <FormSelect
                    label="Parent Account"
                    v-model="form.parent_id"
                    :options="parentOptions"
                />

                <FormInput label="Level" type="number" v-model="form.level" />

                <FormCheckbox label="Header Account" v-model="form.is_header" />

                <FormCheckbox label="Active" v-model="form.is_active" />
            </div>

            <template #footer>
                <div class="flex justify-end gap-3 p-6">
                    <button @click="closeModal">Cancel</button>

                    <PrimaryButton @click="submit"> Simpan </PrimaryButton>
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
