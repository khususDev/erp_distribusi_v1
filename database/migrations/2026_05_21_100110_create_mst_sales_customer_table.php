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
        Schema::create('mst_sales_customer', function (Blueprint $table) {
            $table->id();

            // BASIC
            $table->string('code')->unique();
            $table->string('name');

            // CATEGORY
            $table->foreignId('customer_category_id')
                ->nullable()
                ->constrained('mst_sales_customer_category')
                ->nullOnDelete();

            // AREA
            $table->foreignId('sales_area_id')
                ->nullable()
                ->constrained('mst_sales_area')
                ->nullOnDelete();

            // CONTACT
            $table->string('phone')->nullable();
            $table->string('email')->nullable();

            // ADDRESS
            $table->text('address')->nullable();
            $table->string('city')->nullable();

            // FINANCE
            $table->foreignId('payment_term_id')
                ->nullable()
                ->constrained('mst_finance_payment_term')
                ->nullOnDelete();

            $table->foreignId('currency_id')
                ->nullable()
                ->constrained('mst_finance_currency')
                ->nullOnDelete();

            $table->decimal('credit_limit', 18, 2)->default(0);

            // TAX
            $table->string('tax_number')->nullable();

            // STATUS
            $table->boolean('is_active')->default(true);

            // NOTES
            $table->text('description')->nullable();

            $table->timestamps();
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_sales_customer');
    }
};
