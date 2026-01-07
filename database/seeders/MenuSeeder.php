<?php

namespace Database\Seeders;

use App\Models\Menu;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('menus')->insert([
            [
                'name' => 'Dashboard',
                'route' => 'dashboard',
                'icon' => 'fas fa-home',
                'parent_id' => null,
                'order' => 1
            ],
            [
                'name' => 'Master Data',
                'route' => null,
                'icon' => 'fas fa-file',
                'parent_id' => null,
                'order' => 2
            ],
            [
                'name' => 'Management',
                'route' => null,
                'icon' => 'fas fa-id-badge',
                'parent_id' => null,
                'order' => 3
            ],
            [
                'name' => 'Department',
                'route' => 'mst_department',
                'icon' => null,
                'parent_id' => null,
                'order' => 1
            ],
            [
                'name' => 'Product',
                'route' => 'mst_product',
                'icon' => null,
                'parent_id' => null,
                'order' => 2
            ],
            [
                'name' => 'User',
                'route' => 'mng_user',
                'icon' => null,
                'parent_id' => null,
                'order' => 1
            ]
        ]);
    }
}
