<script setup>
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";

import DataTable from "@/Components/Table/DataTable.vue";
import Pagination from "@/Components/Table/Pagination.vue";
import TableAction from "@/Components/Table/TableAction.vue";

import FormInput from "@/Components/Form/FormInput.vue";
import FormCheckbox from "@/Components/Form/FormCheckbox.vue";

import Modal from "@/Components/Modal/Modal.vue";

import PrimaryButton from "@/Components/Button/PrimaryButton.vue";

import StatusBadge from "@/Components/Badge/StatusBadge.vue";

import useCrud from "@/Composables/useCrud";

const props = defineProps({
    companies: Object,
});

const {
    form,
    showModal,
    isEdit,
    openCreate,
    openEdit,
    submit,
    destroy,
    closeModal,
} = useCrud({
    initialForm: {
        name: "",
        code: "",
        phone: "",
        email: "",
        address: "",
        is_active: true,
    },

    storeRoute: "/mst_grl_company",
    updateRoute: "/mst_grl_company",
    deleteRoute: "/mst_grl_company",

    deleteMessage: "Hapus company ini?",
});
</script>

<template>
    <AppLayout>
        <DataTable
            :headers="['Company', 'Phone', 'Email', 'Status', 'Action']"
            :from="companies.from"
            :to="companies.to"
            :total="companies.total"
        >
            <!-- TOP ACTION -->
            <template #top-actions>
                <PrimaryButton @click="openCreate">
                    Tambah Company
                </PrimaryButton>
            </template>

            <!-- TABLE BODY -->
            <tr
                v-for="company in companies.data"
                :key="company.id"
                class="border-b border-stroke dark:border-strokedark"
            >
                <!-- CHECKBOX -->
                <td class="px-4 py-5 xl:pl-11">
                    <input type="checkbox" />
                </td>

                <!-- COMPANY -->
                <td class="px-4 py-5">
                    <h5 class="font-medium text-black dark:text-white">
                        {{ company.name }}
                    </h5>

                    <p class="text-sm text-body">
                        {{ company.code }}
                    </p>
                </td>

                <!-- PHONE -->
                <td class="px-4 py-5 text-black dark:text-white">
                    {{ company.phone ?? "-" }}
                </td>

                <!-- EMAIL -->
                <td class="px-4 py-5 text-black dark:text-white">
                    {{ company.email ?? "-" }}
                </td>

                <!-- STATUS -->
                <td class="px-4 py-5">
                    <StatusBadge :active="company.is_active" />
                </td>

                <!-- ACTION -->
                <td class="px-4 py-5">
                    <TableAction
                        @edit="openEdit(company)"
                        @delete="destroy(company.id)"
                    />
                </td>
            </tr>

            <!-- PAGINATION -->
            <template #pagination>
                <Pagination :links="companies.links" />
            </template>
        </DataTable>

        <!-- MODAL -->
        <Modal
            :show="showModal"
            :title="isEdit ? 'Edit Company' : 'Tambah Company'"
            @close="closeModal"
        >
            <div class="flex flex-col gap-4">
                <FormInput
                    label="Company Name"
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
                    label="Address"
                    v-model="form.address"
                    :error="form.errors.address"
                />

                <FormCheckbox label="Active" v-model="form.is_active" />
            </div>

            <template #footer>
                <div class="flex items-center justify-end gap-3">
                    <button
                        @click="closeModal"
                        class="rounded-lg border border-stroke px-4 py-2 text-black dark:border-strokedark dark:text-white"
                    >
                        Cancel
                    </button>

                    <PrimaryButton @click="submit"> Simpan </PrimaryButton>
                </div>
            </template>
        </Modal>
    </AppLayout>
</template>
