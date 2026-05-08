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
        Schema::create('mst_salesman_area', function (Blueprint $table) {
            $table->id();
            $table->foreignId('salesman_id')->constrained('mst_salesman')->cascadeOnDelete();
            $table->foreignId('sales_area_id')->constrained('mst_sales_area')->cascadeOnDelete();
            $table->boolean('is_active')->default(true);
            $table->timestamps();

            $table->unique(['salesman_id', 'sales_area_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_salesman_area');
    }
};
