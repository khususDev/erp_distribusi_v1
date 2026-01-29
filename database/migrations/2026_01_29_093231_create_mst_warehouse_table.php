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
        Schema::create('mst_warehouse', function (Blueprint $table) {
            $table->id();

            $table->string('name');
            $table->string('code')->unique();

            // relasi organisasi
            $table->foreignId('location_id')
                ->nullable()
                ->constrained('location')
                ->nullOnDelete();

            $table->text('address')->nullable();

            $table->boolean('is_active')->default(true);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_warehouse');
    }
};
