<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
</script>

<template>
    <AppLayout>
        <section class="section">
            <div class="card">
                <!-- CARD HEADER -->
                <div
                    class="card-header d-flex justify-content-between align-items-center p-1 pl-3 pr-3"
                >
                    <h6 class="section-title">User Management</h6>

                    <button class="btn btn-primary btn-sm">
                        <i class="fas fa-plus"></i> Tambah User
                    </button>
                </div>

                <!-- CARD BODY -->
                <div class="card-body p-0">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>Nama</th>
                                <th>Code</th>
                                <th>Status</th>
                                <th width="150">Aksi</th>
                            </tr>
                        </thead>

                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <!-- MODAL -->
        
    </AppLayout>
</template>