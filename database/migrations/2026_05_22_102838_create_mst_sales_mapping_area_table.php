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
        Schema::create('mst_sales_mapping_area', function (Blueprint $table) {
            $table->id();

            $table->foreignId('salesman_id')
                ->constrained('mst_sales_salesman')
                ->cascadeOnDelete();

            $table->foreignId('customer_id')
                ->constrained('mst_sales_customer')
                ->cascadeOnDelete();

            $table->boolean('is_active')->default(true);

            $table->text('description')->nullable();

            $table->timestamps();

            $table->unique([
                'salesman_id',
                'customer_id'
            ], 'mapping_salesman_customer_unique');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_sales_mapping_area');
    }
};
