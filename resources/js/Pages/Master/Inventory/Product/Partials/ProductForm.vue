<script setup>
import { computed } from "vue";
import FormInput from "@/Components/Form/FormInput.vue";
import FormSelect from "@/Components/Form/FormSelect.vue";
import FormCheckbox from "@/Components/Form/FormCheckbox.vue";
import FormTextarea from "@/Components/Form/FormTextarea.vue";

const props = defineProps({
    form: Object,
    categories: Array,
    brands: Array,
    uoms: Array,
    taxes: Array,
});

const addUomRow = () => {
    props.form.product_uoms.push({
        uom_id: null,
        conversion_rate: 1,
        is_base: false,
    });
};

const removeUomRow = (index) => {
    props.form.product_uoms.splice(index, 1);
};

const setBaseUom = (selectindex) => {
    props.form.product_uoms.forEach((item, index) => {
        item.is_base = index === selectindex;
    });
};

// Mapping data dari DB (id, name) menjadi format (value, label) untuk FormSelect
const categoryOptions = computed(() =>
    props.categories.map((c) => ({ label: c.name, value: c.id })),
);
const brandOptions = computed(() =>
    props.brands.map((b) => ({ label: b.name, value: b.id })),
);
const uomOptions = computed(() =>
    props.uoms.map((u) => ({ label: u.name, value: u.id })),
);
const taxOptions = computed(() =>
    props.taxes.map((t) => ({ label: t.name, value: t.id })),
);
</script>

<template>
    <div class="grid grid-cols-1 gap-5 md:grid-cols-2">
        <FormInput label="SKU" v-model="form.sku" :error="form.errors.sku" />
        <FormInput
            label="Product Name"
            v-model="form.name"
            :error="form.errors.name"
        />
        <FormInput
            label="Barcode"
            v-model="form.barcode"
            :error="form.errors.barcode"
        />

        <FormSelect
            label="Category"
            v-model="form.category_id"
            :options="categoryOptions"
            :error="form.errors.category_id"
        />
        <FormSelect
            label="Brand"
            v-model="form.brand_id"
            :options="brandOptions"
            :error="form.errors.brand_id"
        />
        <FormSelect
            label="Base UOM"
            v-model="form.uom_id"
            :options="uomOptions"
            :error="form.errors.uom_id"
        />
        <FormSelect
            label="Tax"
            v-model="form.tax_id"
            :options="taxOptions"
            :error="form.errors.tax_id"
        />

        <FormInput
            label="Purchase Price"
            type="number"
            v-model="form.purchase_price"
            :error="form.errors.purchase_price"
        />
        <FormInput
            label="Selling Price"
            type="number"
            v-model="form.selling_price"
            :error="form.errors.selling_price"
        />
        <FormInput
            label="Min Stock"
            type="number"
            v-model="form.min_stock"
            :error="form.errors.min_stock"
        />
        <FormInput
            label="Max Stock"
            type="number"
            v-model="form.max_stock"
            :error="form.errors.max_stock"
        />
    </div>

    <div class="mt-5">
        <FormTextarea
            label="Description"
            v-model="form.description"
            :error="form.errors.description"
        />
    </div>

    <!-- PRODUCT UOM -->
    <div class="mt-8">
        <div class="mb-3 flex items-center justify-between">
            <h3 class="text-lg font-semibold text-black dark:text-white">
                Product UOM
            </h3>

            <button
                type="button"
                @click="addUomRow"
                class="rounded-lg bg-primary px-3 py-2 text-sm text-white"
            >
                + Add UOM
            </button>
        </div>

        <div class="overflow-x-auto rounded-lg border border-stroke">
            <table class="w-full">
                <thead>
                    <tr class="bg-gray-100 dark:bg-meta-4">
                        <th class="px-4 py-3 text-left">UOM</th>
                        <th class="px-4 py-3 text-left">Conversion</th>
                        <th class="px-4 py-3 text-center">Base</th>
                        <th class="px-4 py-3 text-center">Action</th>
                    </tr>
                </thead>

                <tbody>
                    <tr
                        v-for="(item, index) in props.form.product_uoms"
                        :key="index"
                        class="border-t border-stroke dark:border-strokedark"
                    >
                        <!-- UOM -->
                        <td class="px-4 py-3">
                            <FormSelect
                                label="Base UOM"
                                v-model="form.uom_id"
                                :options="uomOptions"
                                :error="form.errors.uom_id"
                            />
                        </td>

                        <!-- CONVERSION -->
                        <td class="px-4 py-3">
                            <FormInput
                                type="number"
                                v-model="item.conversion_rate"
                            />
                        </td>

                        <!-- BASE -->
                        <td class="px-4 py-3 text-center">
                            <input
                                type="checkbox"
                                :checked="item.is_base"
                                @change="setBaseUom(index)"
                            />
                        </td>

                        <!-- ACTION -->
                        <td class="px-4 py-3 text-center">
                            <button
                                type="button"
                                @click="removeUomRow(index)"
                                class="text-danger"
                            >
                                Delete
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="mt-5 flex flex-wrap gap-5">
        <FormCheckbox label="Sellable" v-model="form.is_sellable" />
        <FormCheckbox label="Purchaseable" v-model="form.is_purchaseable" />
        <FormCheckbox label="Track Stock" v-model="form.track_stock" />
        <FormCheckbox label="Active" v-model="form.is_active" />
    </div>
</template>
