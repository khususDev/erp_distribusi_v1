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
        Schema::create('mst_finance_currency', function (Blueprint $table) {
            $table->id();
            $table->string('code')->unique();   // IDR, USD, EUR
            $table->string('name');             // Rupiah, Dollar
            $table->string('symbol');           // Rp, $
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('currency');
    }
};
