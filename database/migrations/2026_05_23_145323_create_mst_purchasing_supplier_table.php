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
        Schema::create('mst_purchasing_supplier', function (Blueprint $table) {
            $table->id();

            // BASIC
            $table->string('code')->unique();
            $table->string('name');

            // RELATION
            $table->foreignId('supplier_category_id')
                ->nullable()
                ->constrained('mst_purchasing_supplier_category')
                ->nullOnDelete();

            $table->foreignId('payment_term_id')
                ->nullable()
                ->constrained('mst_finance_payment_term')
                ->nullOnDelete();

            $table->foreignId('currency_id')
                ->nullable()
                ->constrained('mst_finance_currency')
                ->nullOnDelete();

            // CONTACT
            $table->string('phone')->nullable();
            $table->string('email')->nullable();

            // PIC
            $table->string('pic_name')->nullable();

            // ADDRESS
            $table->text('address')->nullable();
            $table->string('city')->nullable();

            // TAX
            $table->string('tax_number')->nullable();

            // FINANCIAL
            $table->decimal('credit_limit', 18, 2)->default(0);

            // STATUS
            $table->boolean('is_active')->default(true);

            // DESCRIPTION
            $table->text('description')->nullable();

            $table->timestamps();
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_purchasing_supplier');
    }
};
