<script setup>
import AppLayout from "@/Layouts/AppLayout.vue";
defineProps({
  users: Array,
})
</script>

<template>
    <AppLayout>
  <div class="section">
    <h4>Manajemen User</h4>

    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Nama</th>
          <th>Email</th>
          <th>Aksi</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in users" :key="user.id">
          <td>{{ user.name }}</td>
          <td>{{ user.email }}</td>
          <td>
            <a
              :href="route('users.menus.edit', user.id)"
              class="btn btn-sm btn-primary"
            >
              Atur Menu
            </a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  </AppLayout>
</template>
