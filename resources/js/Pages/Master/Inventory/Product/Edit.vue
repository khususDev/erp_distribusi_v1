<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
import ProductForm from "./Partials/ProductForm.vue";

defineProps({
    product: Object,
    categories: Array,
    brands: Array,
    uoms: Array,
});
</script>

<template>
    <AppLayout>
        <ProductForm
            :product="product"
            :categories="categories"
            :brands="brands"
            :uoms="uoms"
            :action="`/mst_inv_product/${product.id}`"
            method="put"
        />
    </AppLayout>
</template>
