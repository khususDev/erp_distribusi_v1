<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('mst_inventory_product', function (Blueprint $table) {
            $table->string('sku')
                ->nullable()        // ⬅️ PENTING
                ->after('id');

            $table->enum('type', ['stock', 'non_stock', 'service'])
                ->default('stock')
                ->after('brand_id');

            $table->boolean('is_sellable')
                ->default(true)
                ->after('type');

            $table->boolean('is_purchaseable')
                ->default(true)
                ->after('is_sellable');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('mst_inventory_product', function (Blueprint $table) {
            $table->dropColumn([
                'sku',
                'type',
                'is_sellable',
                'is_purchaseable',
            ]);
        });
    }
};
