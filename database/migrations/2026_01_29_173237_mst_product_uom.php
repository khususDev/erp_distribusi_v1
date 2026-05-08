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
        Schema::create('mst_inventory_product_uom', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('mst_inventory_product')->cascadeOnDelete();
            $table->foreignId('uom_id')->constrained('uom');
            $table->decimal('conversion_rate', 15, 4)->default(1);
            $table->boolean('is_base')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_product_uom');
    }
};
