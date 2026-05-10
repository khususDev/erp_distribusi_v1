<script setup>
import { ref } from "vue";
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import DataTable from "@/Components/DataTable.vue";
import Modal from "@/Components/Modal.vue";
import { useForm } from "@inertiajs/vue3";
import { router } from "@inertiajs/vue3";
import FormInput from "@/Components/FormInput.vue";

const props = defineProps({ companies: Array, errors: Object });
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

const openCreate = () => {
    isEdit.value = false;
    form.value = {
        id: null,
        name: "",
        code: "",
        phone: "",
        email: "",
        address: "",
        is_active: true,
    };
    showModal.value = true;
};

const openEdit = (company) => {
    isEdit.value = true;
    form.value = { ...company };
    showModal.value = true;
};

function submit() {
    if (isEdit.value) {
        form.put(`/mst_grl_company/${form.id}`, {
            onSuccess: () => {
                showModal.value = false;
                // Notifikasi akan muncul otomatis (kita buat di langkah bawah)
            },
        });
    } else {
        form.post("/mst_grl_company", {
            onSuccess: () => {
                form.reset();
                showModal.value = false;
            },
        });
    }
}

const destroy = (id) => {
    if (confirm("Hapus company ini?")) router.delete(`/mst_grl_company/${id}`);
};
</script>

<template>
    <AppLayout>
        <DataTable
            title="Master Company"
            :headers="['Nama', 'Code', 'Email', 'Status', 'Aksi']"
            :isEmpty="companies.length === 0"
        >
            <template #header-action>
                <button
                    @click="openCreate"
                    class="inline-flex items-center justify-center rounded-md bg-primary px-6 py-2 text-white hover:bg-opacity-90"
                >
                    Tambah Company
                </button>
            </template>

            <tr
                v-for="company in companies"
                :key="company.id"
                class="border-b border-[#eee] dark:border-strokedark"
            >
                <td class="px-4 py-5 font-medium text-black dark:text-white">
                    {{ company.name }}
                </td>
                <td class="px-4 py-5 text-black dark:text-white">
                    {{ company.code }}
                </td>
                <td class="px-4 py-5 text-black dark:text-white">
                    {{ company.email ?? "-" }}
                </td>
                <td class="px-4 py-5">
                    <span
                        :class="
                            company.is_active
                                ? 'bg-success/10 text-success'
                                : 'bg-danger/10 text-danger'
                        "
                        class="rounded-full px-3 py-1 text-sm font-medium"
                    >
                        {{ company.is_active ? "Aktif" : "Nonaktif" }}
                    </span>
                </td>
                <td class="px-4 py-5">
                    <div class="flex items-center space-x-3.5">
                        <button
                            @click="openEdit(company)"
                            class="hover:text-primary"
                        >
                            Edit
                        </button>
                        <button
                            @click="destroy(company.id)"
                            class="hover:text-danger"
                        >
                            Hapus
                        </button>
                    </div>
                </td>
            </tr>
        </DataTable>

        <Modal
            :show="showModal"
            :title="isEdit ? 'Edit Company' : 'Tambah Company'"
            @close="showModal = false"
        >
            <div class="flex flex-col gap-4">
                <FormInput
                    v-model="form.name"
                    label="Company Name"
                    placeholder="Enter company name"
                    :error="errors.name"
                    class="w-full rounded border-[1.5px] border-stroke bg-gray px-5 py-3 outline-none dark:border-form-strokedark"
                    required
                />

                <FormInput
                    v-model="form.code"
                    label="Company Code"
                    placeholder="Contoh: PTM, CVM, UD, dll"
                    :error="errors.code"
                    :disabled="isEdit"
                    class="w-full rounded border-[1.5px] border-stroke bg-gray px-5 py-3 outline-none dark:border-form-strokedark"
                    required
                />

                <FormInput
                    v-model="form.email"
                    label="Company Email"
                    placeholder="example@company.com"
                    :error="errors.email"
                    :disabled="isEdit"
                    class="w-full rounded border-[1.5px] border-stroke bg-gray px-5 py-3 outline-none dark:border-form-strokedark"
                    required
                />
            </div>
            <template #footer>
                <button
                    @click="submit"
                    class="flex justify-center rounded bg-primary px-6 py-2 font-medium text-gray hover:bg-opacity-90"
                >
                    Simpan Data
                </button>
            </template>
        </Modal>
    </AppLayout>
</template>
