<script setup>
import AppLayout from "@/Layouts/AuthenticatedLayout.vue";
import Breadcrumb from "@/Components/Page/Breadcrumb.vue";
import PrimaryButton from "@/Components/Button/PrimaryButton.vue";

import ProductForm from "./Partials/ProductForm.vue";

import { useForm } from "@inertiajs/vue3";

const props = defineProps({
    product: Object,

    categories: Array,
    brands: Array,
    uoms: Array,
    taxes: Array,
});

const form = useForm({
    sku: props.product.sku,
    name: props.product.name,
    barcode: props.product.barcode,

    category_id: props.product.category_id,
    brand_id: props.product.brand_id,
    uom_id: props.product.uom_id,
    tax_id: props.product.tax_id,

    type: props.product.type,

    track_stock: props.product.track_stock,

    is_sellable: props.product.is_sellable,
    is_purchaseable: props.product.is_purchaseable,
    is_active: props.product.is_active,

    min_stock: props.product.min_stock,
    max_stock: props.product.max_stock,

    purchase_price: props.product.purchase_price,
    selling_price: props.product.selling_price,

    description: props.product.description,
});

const submit = () => {
    form.put(`/mst_inv_product/${props.product.hash_id}`);
};
</script>

<template>
    <AppLayout>
        <Breadcrumb
            pageTitle="Edit Product"
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
                <PrimaryButton @click="submit"> Update Product </PrimaryButton>
            </div>
        </div>
    </AppLayout>
</template>
