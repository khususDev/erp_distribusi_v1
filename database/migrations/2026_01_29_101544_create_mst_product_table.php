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
        Schema::create('mst_product', function (Blueprint $table) {
            $table->id();

            $table->string('code')->unique();
            $table->string('name');
            $table->string('barcode')->nullable()->unique();

            $table->foreignId('category_id')->constrained('category');
            $table->foreignId('brand_id')->nullable()->constrained('mst_brand');
            $table->foreignId('uom_id')->constrained('uom');

            $table->enum('type', ['stock', 'non_stock', 'service'])->default('stock');

            $table->decimal('min_stock', 15, 2)->default(0);
            $table->decimal('max_stock', 15, 2)->nullable();

            $table->decimal('purchase_price', 18, 2)->default(0);
            $table->decimal('selling_price', 18, 2)->default(0);

            $table->foreignId('tax_id')->nullable()->constrained('tax');

            $table->boolean('is_active')->default(true);
            $table->text('description')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_product');
    }
};
