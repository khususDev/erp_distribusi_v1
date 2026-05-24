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
        Schema::create('mst_system_document_number', function (Blueprint $table) {
            $table->id();

            $table->string('transaction_type')->unique();
            /*
        PO
        SO
        GR
        INV
        etc
    */

            $table->string('prefix');
            $table->integer('digit')->default(5);

            $table->boolean('reset_yearly')->default(true);
            $table->boolean('reset_monthly')->default(false);

            $table->integer('current_number')->default(0);

            $table->boolean('is_active')->default(true);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_system_document_number');
    }
};
