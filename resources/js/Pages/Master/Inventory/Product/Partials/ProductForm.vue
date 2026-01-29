<script setup>
import { ref } from "vue";
import { router } from "@inertiajs/vue3";

const props = defineProps({
    product: Object,
    categories: Array,
    brands: Array,
    uoms: Array,
    action: String,
    method: String,
});

const form = ref({
    code: props.product?.code ?? "",
    name: props.product?.name ?? "",
    category_id: props.product?.category_id ?? "",
    brand_id: props.product?.brand_id ?? "",
    is_active: props.product?.is_active ?? true,
    uoms: props.product?.uoms ?? [
        { uom_id: "", conversion_rate: 1, is_base: true },
    ],
});

const submit = () => {
    router[props.method](props.action, form.value);
};

const addUom = () => {
    form.value.uoms.push({
        uom_id: "",
        conversion_rate: 1,
        is_base: false,
    });
};

const removeUom = (index) => {
    form.value.uoms.splice(index, 1);
};
</script>

<template>
    <form @submit.prevent="submit">
        <div class="card">
            <div class="card-body">
                <div class="form-group">
                    <label>Kode Product</label>
                    <input v-model="form.code" class="form-control" required />
                    <label>Nama Product</label>
                    <input v-model="form.name" class="form-control" required />
                </div>

                <div class="form-row">
                    <div class="form-group col">
                        <label>Category</label>
                        <select v-model="form.category_id" class="form-control">
                            <option value="">- pilih -</option>
                            <option
                                v-for="c in categories"
                                :key="c.id"
                                :value="c.id"
                            >
                                {{ c.name }}
                            </option>
                        </select>
                    </div>

                    <div class="form-group col">
                        <label>Brand</label>
                        <select v-model="form.brand_id" class="form-control">
                            <option value="">- pilih -</option>
                            <option
                                v-for="b in brands"
                                :key="b.id"
                                :value="b.id"
                            >
                                {{ b.name }}
                            </option>
                        </select>
                    </div>
                </div>

                <hr />

                <h6>Multi UOM</h6>
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th>UOM</th>
                            <th>Konversi</th>
                            <th>Base</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(uom, i) in form.uoms" :key="i">
                            <td>
                                <select
                                    v-model="uom.uom_id"
                                    class="form-control"
                                >
                                    <option value="">- pilih -</option>
                                    <option
                                        v-for="u in uoms"
                                        :key="u.id"
                                        :value="u.id"
                                    >
                                        {{ u.name }}
                                    </option>
                                </select>
                            </td>
                            <td>
                                <input
                                    type="number"
                                    v-model="uom.conversion_rate"
                                    class="form-control"
                                />
                            </td>
                            <td class="text-center">
                                <input
                                    type="radio"
                                    :checked="uom.is_base"
                                    @change="
                                        form.uoms.forEach(
                                            (x) => (x.is_base = false),
                                        );
                                        uom.is_base = true;
                                    "
                                />
                            </td>
                            <td>
                                <button
                                    type="button"
                                    class="btn btn-sm btn-danger"
                                    @click="removeUom(i)"
                                >
                                    ✕
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <button
                    type="button"
                    class="btn btn-sm btn-secondary"
                    @click="addUom"
                >
                    + Tambah UOM
                </button>
            </div>

            <div class="card-footer text-right">
                <button class="btn btn-primary">Simpan</button>
            </div>
        </div>
    </form>
</template>
