<script setup>
    import AppLayout from "@/Layouts/AppLayout.vue";
    defineProps({
        users: Array,
    });
</script>

<template>
    <AppLayout>
        <section class="section">
            <div class="card">
                <!-- CARD HEADER -->
                <div class="card-header d-flex justify-content-between align-items-center p-1 pl-3 pr-3">
                    <h6 class="section-title">Menu Permission</h6>

                    <button class="btn btn-primary btn-sm">
                        <i class="fas fa-plus"></i> Tambah Permission
                    </button>
                </div>

                <!-- CARD BODY -->
                <div class="card-body p-0">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>Nama</th>
                                <th>Email</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr v-for="user in users" :key="user.id">
                                <td>{{ user . name }}</td>
                                <td>{{ user . email }}</td>
                                <td>
                                    <a :href="route('mng_menupermission.edit', user.id)"
                                        class="btn btn-sm btn-primary">
                                        Atur Menu
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <!-- MODAL -->
    </AppLayout>
</template>

