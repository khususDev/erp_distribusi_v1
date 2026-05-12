<script setup>
import { ref } from "vue";
// 1. Pastikan SEMUA komponen diimpor di sini
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import DataTable from "@/Components/DataTable.vue";
import Pagination from "@/Components/Pagination.vue";
import TableAction from "@/Components/TableAction.vue";
import FormInput from "@/Components/FormInput.vue";
import Modal from "@/Components/Modal.vue";
import { useForm, router } from "@inertiajs/vue3";

// 2. Ubah tipe 'companies' menjadi Object (karena hasil paginate adalah Object)
const props = defineProps({
    companies: Object,
    errors: Object,
});

const showModal = ref(false);
const isEdit = ref(false);

const form = useForm({
    id: null,
    name: "",
    code: "",
    phone: "",
    email: "",
    address: "",
    is_active: true,
});

// Fungsi-fungsi lainnya (openCreate, openEdit, submit, destroy) tetap sama...
const openCreate = () => {
    isEdit.value = false;
    form.reset();
    showModal.value = true;
};

const openEdit = (company) => {
    isEdit.value = true;
    form.clearErrors();
    form.id = company.id;
    form.name = company.name;
    form.code = company.code;
    form.phone = company.phone;
    form.email = company.email;
    form.address = company.address;
    form.is_active = company.is_active;
    showModal.value = true;
};

const submit = () => {
    if (isEdit.value) {
        form.put(route("mst_grl_company.update", form.id), {
            onSuccess: () => (showModal.value = false),
        });
    } else {
        form.post(route("mst_grl_company.store"), {
            onSuccess: () => {
                form.reset();
                showModal.value = false;
            },
        });
    }
};

const destroy = (id) => {
    if (confirm("Hapus company ini?")) {
        router.delete(route("mst_grl_company.destroy", id));
    }
};
</script>

<template>
    <AppLayout>
        <DataTable
            :headers="['User', 'Position', 'Salary', 'Status', 'Action']"
            :from="companies.from"
            :to="companies.to"
            :total="companies.total"
        >
            <template #top-actions>
                <button
                    @click="openCreate"
                    class="flex items-center gap-2 rounded bg-primary px-4 py-2 font-medium text-white hover:bg-opacity-90"
                >
                    Tambah
                </button>
            </template>

            <tr
                v-for="(company, key) in companies.data"
                :key="company.id"
                class="border-b border-stroke dark:border-strokedark"
            >
                <td class="px-4 py-5 xl:pl-11"><input type="checkbox" /></td>

                <td class="px-4 py-5">
                    <h5 class="font-medium text-black dark:text-white">
                        {{ company.name }}
                    </h5>
                    <p class="text-sm">{{ company.email }}</p>
                </td>

                <td class="px-4 py-5 text-black dark:text-white">Manager</td>
                <td class="px-4 py-5 text-black dark:text-white">$80,000</td>

                <td class="px-4 py-5">
                    <span
                        :class="
                            company.is_active
                                ? 'bg-success/10 text-success'
                                : 'bg-danger/10 text-danger'
                        "
                        class="inline-flex rounded-full px-3 py-1 text-sm font-medium"
                    >
                        {{ company.is_active ? "Active" : "Inactive" }}
                    </span>
                </td>

                <td class="px-4 py-5">
                    <TableAction
                        @edit="openEdit(company)"
                        @delete="destroy(company.id)"
                    />
                </td>
            </tr>

            <template #pagination>
                <Pagination :links="companies.links" />
            </template>
        </DataTable>

        <Modal
            :show="showModal"
            :title="isEdit ? 'Edit Company' : 'Tambah Company'"
            @close="showModal = false"
        >
            <div class="flex flex-col gap-4">
                <FormInput
                    v-model="form.name"
                    label="Nama"
                    :error="form.errors.name"
                />
                <FormInput
                    v-model="form.code"
                    label="Code"
                    :error="form.errors.code"
                    :disabled="isEdit"
                />
                <FormInput
                    v-model="form.email"
                    label="Email"
                    :error="form.errors.email"
                />
                <FormInput
                    v-model="form.phone"
                    label="Phone"
                    :error="form.errors.phone"
                />
                <FormInput
                    v-model="form.address"
                    label="Address"
                    :error="form.errors.address"
                />
                <div class="flex items-center gap-2">
                    <input
                        type="checkbox"
                        v-model="form.is_active"
                        id="is_active"
                    />
                    <label for="is_active" class="text-black dark:text-white"
                        >Aktif</label
                    >
                </div>
            </div>
            <template #footer>
                <button
                    @click="submit"
                    class="rounded bg-primary px-6 py-2 text-white"
                >
                    Simpan
                </button>
            </template>
        </Modal>
    </AppLayout>
</template>
