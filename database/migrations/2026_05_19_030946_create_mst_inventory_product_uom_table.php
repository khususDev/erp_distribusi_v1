<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('mst_inventory_product_uom', function (Blueprint $table) {
            $table->id();

            // Foreign Key ke tabel produk dan uom.
            // Catatan: Ganti 'mst_products' dan 'mst_uoms' jika nama tabel master Anda berbeda.
            $table->foreignId('product_id')->constrained('mst_inventory_product')->onDelete('cascade');
            $table->foreignId('uom_id')->constrained('mst_inventory_uom')->onDelete('cascade');

            // Menggunakan decimal agar akurat jika ada konversi pecahan (misal: 0.5 atau 1.25)
            $table->decimal('conversion_rate', 12, 4)->default(1.0000);

            // Menandakan apakah ini UOM utama/terkecil dari produk tersebut
            $table->boolean('is_base')->default(false);

            // Barcode dibuat nullable & unique karena tidak semua UOM wajib punya barcode, tapi jika ada tidak boleh kembar
            $table->string('barcode')->nullable()->unique();

            // Menggunakan decimal (15,2) untuk akurasi nilai mata uang keuangan
            $table->decimal('purchase_price', 15, 2)->nullable()->default(0.00);
            $table->decimal('selling_price', 15, 2)->nullable()->default(0.00);

            $table->timestamps(); // Menghasilkan created_at dan updated_at

            // Opsional: Mencegah adanya duplikasi kombinasi product_id dan uom_id yang sama
            $table->unique(['product_id', 'uom_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_inventory_product_uom');
    }
};
