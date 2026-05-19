<script setup>
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import Breadcrumb from "@/Components/Page/Breadcrumb.vue";
import PrimaryButton from "@/Components/Button/PrimaryButton.vue";

import ProductForm from "./Partials/ProductForm.vue";

import { useForm } from "@inertiajs/vue3";

const props = defineProps({
    categories: Array,
    brands: Array,
    uoms: Array,
    taxes: Array,
});

const form = useForm({
    sku: "",
    name: "",
    barcode: "",

    category_id: "",
    brand_id: "",
    uom_id: "",
    tax_id: "",

    type: "stock",

    track_stock: true,

    is_sellable: true,
    is_purchaseable: true,
    is_active: true,

    min_stock: 0,
    max_stock: 0,

    purchase_price: 0,
    selling_price: 0,

    description: "",

    product_uoms: [
        {
            uom_id: "",
            conversion_rate: 1,
            is_base: true,
        },
    ],
});

const submit = () => {
    form.post("/mst_inv_product");
};
</script>

<template>
    <AppLayout>
        <Breadcrumb
            pageTitle="Create Product"
            :crumbs="['Master Data', 'Inventory', 'Product']"
        />

        <div
            class="rounded-lg border border-stroke bg-white p-6 shadow-default dark:border-strokedark dark:bg-boxdark"
        >
            <ProductForm
                :form="form"
                :categories="categories"
                :brands="brands"
                :uoms="uoms"
                :taxes="taxes"
            />

            <div class="mt-6 flex justify-end gap-3">
                <PrimaryButton @click="submit"> Save Product </PrimaryButton>
            </div>
        </div>
    </AppLayout>
</template>
