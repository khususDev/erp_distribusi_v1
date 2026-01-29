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
        Schema::create('mst_storage', function (Blueprint $table) {
            $table->id();

            $table->string('name');
            $table->string('code')->unique();

            // relasi ke warehouse
            $table->foreignId('warehouse_id')
                ->constrained('mst_warehouse')
                ->cascadeOnDelete();

            // optional: untuk struktur rak bertingkat (A1-01, A1-02, dll)
            $table->foreignId('parent_id')
                ->nullable()
                ->constrained('mst_storage')
                ->nullOnDelete();

            $table->boolean('is_active')->default(true);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_storage');
    }
};
