<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    public function run()
    {
        // ===== CREATE PERMISSIONS =====
        $permissions = [
            'view_dashboard',
            'view_product',
            'view_user',
            'view_department',
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate([
                'name' => $permission,
                'guard_name' => 'web',
            ]);
        }

        // ===== CREATE ROLES =====
        $admin = Role::firstOrCreate(['name' => 'admin']);
        $staff = Role::firstOrCreate(['name' => 'staff']);

        // ===== ASSIGN PERMISSIONS =====
        $admin->syncPermissions(Permission::all());

        $staff->syncPermissions([
            'view_dashboard',
            'view_product',
        ]);
    }
}
