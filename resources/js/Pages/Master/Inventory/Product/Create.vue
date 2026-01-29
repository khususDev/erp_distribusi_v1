<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
import ProductForm from "./Partials/ProductForm.vue";

defineProps({
    categories: Array,
    brands: Array,
    uoms: Array,
});
</script>

<template>
    <AppLayout>
        <ProductForm
            :categories="categories"
            :brands="brands"
            :uoms="uoms"
            action="/mst_inv_product"
            method="post"
        />
    </AppLayout>
</template>
