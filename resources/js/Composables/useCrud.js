import { ref } from "vue";
import { useForm, router } from "@inertiajs/vue3";

export default function useCrud(config) {
    const showModal = ref(false);
    const showDeleteModal = ref(false);
    const isEdit = ref(false);
    const selectedId = ref(null);
    const loading = ref(false);

    const form = useForm({
        ...config.initialForm,
    });

    // =========================
    // OPEN CREATE
    // =========================
    const openCreate = () => {
        isEdit.value = false;

        form.reset();
        form.clearErrors();

        Object.assign(form, config.initialForm);

        showModal.value = true;
    };

    // =========================
    // OPEN EDIT
    // =========================
    const openEdit = (data) => {
        isEdit.value = true;

        form.clearErrors();

        Object.keys(config.initialForm).forEach((key) => {
            form[key] = data[key];
        });

        selectedId.value = data.id;

        showModal.value = true;
    };

    // =========================
    // CLOSE MODAL
    // =========================
    const closeModal = () => {
        showModal.value = false;

        form.clearErrors();
    };

    // =========================
    // SUBMIT
    // =========================
    const submit = () => {
        loading.value = true;
        if (isEdit.value) {
            form.put(`${config.updateRoute}/${selectedId.value}`, {
                preserveScroll: true,

                onSuccess: () => {
                    closeModal();
                },
                onFinish: () => {
                    loading.value = false;
                }
            });
        } else {
            form.post(`${config.storeRoute}`, {
                preserveScroll: true,

                onSuccess: () => {
                    closeModal();
                    form.reset();
                },
                onFinish: () => {
                    loading.value = false;
                }
            });
        }
    };

    // =========================
// OPEN DELETE MODAL
// =========================
const openDelete = (id) => {
    selectedId.value = id;
    showDeleteModal.value = true;
};

// =========================
// CLOSE DELETE MODAL
// =========================
const closeDeleteModal = () => {
    showDeleteModal.value = false;
};

// =========================
// CONFIRM DELETE
// =========================
const confirmDelete = () => {
    router.delete(
        `${config.deleteRoute}/${selectedId.value}`,
        {
            preserveScroll: true,

            onSuccess: () => {
                closeDeleteModal();
            },
        }
    );
};

    return {
        form,

        showModal,
        showDeleteModal,

        isEdit,

        selectedId,
        loading,

        openCreate,
        openEdit,

        closeModal,

        submit,
        openDelete,
closeDeleteModal,
confirmDelete,
    };
}
