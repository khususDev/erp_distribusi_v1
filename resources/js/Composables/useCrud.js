import { ref } from "vue";
import { useForm, router } from "@inertiajs/vue3";

export default function useCrud(config) {
    const showModal = ref(false);
    const showDeleteModal = ref(false);
    const isEdit = ref(false);
    const selectedId = ref(null);

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
        if (isEdit.value) {
            form.put(`${config.updateRoute}/${selectedId.value}`, {
                preserveScroll: true,

                onSuccess: () => {
                    closeModal();
                },
            });
        } else {
            form.post(`${config.storeRoute}`, {
                preserveScroll: true,

                onSuccess: () => {
                    closeModal();
                    form.reset();
                },
            });
        }
    };

    // =========================
    // DELETE
    // =========================
    const destroy = (id) => {
        if (confirm(config.deleteMessage ?? "Hapus data ini?")) {
            router.delete(`${config.deleteRoute}/${id}`, {
                preserveScroll: true,
            });
        }
    };

    return {
        form,

        showModal,
        showDeleteModal,

        isEdit,

        selectedId,

        openCreate,
        openEdit,

        closeModal,

        submit,
        destroy,
    };
}
