<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        $products = DB::table('mst_inventory_product')->get();

        foreach ($products as $product) {
            DB::table('mst_inventory_product')
                ->where('id', $product->id)
                ->update([
                    'sku' => 'SKU-' . str_pad($product->id, 6, '0', STR_PAD_LEFT),
                ]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
