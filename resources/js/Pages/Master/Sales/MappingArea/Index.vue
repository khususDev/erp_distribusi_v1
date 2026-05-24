<script setup>
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import Breadcrumb from "@/Components/Page/Breadcrumb.vue";
import DataTable from "@/Components/Table/DataTable.vue";
import Pagination from "@/Components/Table/Pagination.vue";
import TableAction from "@/Components/Table/TableAction.vue";
import TableEmpty from "@/Components/Table/TableEmpty.vue";
import TableLoading from "@/Components/Table/TableLoading.vue";

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
    mappingAreas: Object,
    salesmen: Array,
    areas: Array,
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
        salesman_id: "",
        area_id: "",
        description: "",
        is_active: true,
    },

    storeRoute: "/mst_sls_mapping_area",
    updateRoute: "/mst_sls_mapping_area",
    deleteRoute: "/mst_sls_mapping_area",

    deleteMessage: "Hapus mapping area ini?",
});

const salesmanOptions = computed(() =>
    (props.salesmen || []).map((item) => ({
        label: item.name,
        value: item.id,
    })),
);

const areaOptions = computed(() =>
    (props.areas || []).map((item) => ({
        label: item.name,
        value: item.id,
    })),
);

const { search, entries } = useTable({
    route: "/mst_sls_mapping_area",
    search: props.filters?.search ?? "",
    entries: props.filters?.entries ?? 10,
});
</script>

<template>
    <AppLayout>
        <Breadcrumb
            pageTitle="Mapping Area"
            :crumbs="['Master Data', 'Sales']"
        />

        <DataTable
            :headers="[
                'Salesman',
                'Sales Area',
                'Status',
                'Description',
                'Action',
            ]"
            :from="mappingAreas.from"
            :to="mappingAreas.to"
            :total="mappingAreas.total"
            :search="search"
            :entries="entries"
            @search="search = $event"
            @update:entries="entries = $event"
        >
            <template #top-actions>
                <PrimaryButton @click="openCreate" size="sm">
                    Tambah Mapping Area
                </PrimaryButton>
            </template>

            <TableLoading v-if="loading" :rows="5" :cols="5" />

            <tr
                v-else
                v-for="mapping in mappingAreas.data"
                :key="mapping.id"
                class="border-b border-stroke dark:border-strokedark"
            >
                <td class="px-4 py-4">
                    {{ mapping.salesman?.name }}
                </td>

                <td class="px-4 py-4 text-center">
                    {{ mapping.area?.name }}
                </td>

                <td class="px-4 py-4 text-center">
                    <StatusBadge :active="mapping.is_active" />
                </td>

                <td class="px-4 py-4">
                    {{ mapping.description }}
                </td>

                <td class="px-4 py-4 text-center">
                    <TableAction
                        @edit="openEdit(mapping)"
                        @delete="openDelete(mapping.id)"
                    />
                </td>
            </tr>

            <TableEmpty
                v-if="!loading && mappingAreas.data.length === 0"
                :colspan="5"
            />

            <template #pagination>
                <Pagination :links="mappingAreas.links" />
            </template>
        </DataTable>

        <!-- MODAL -->
        <Modal
            :show="showModal"
            :title="isEdit ? 'Edit Mapping Area' : 'Tambah Mapping Area'"
            @close="closeModal"
        >
            <div class="flex flex-col gap-4 p-6">
                <FormSelect
                    label="Salesman"
                    v-model="form.salesman_id"
                    :options="salesmanOptions"
                    :error="form.errors.salesman_id"
                />

                <FormSelect
                    label="Sales Area"
                    v-model="form.area_id"
                    :options="areaOptions"
                    :error="form.errors.area_id"
                />

                <FormTextarea
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
