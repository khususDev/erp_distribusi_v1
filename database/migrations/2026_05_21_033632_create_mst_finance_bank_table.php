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
        Schema::create('mst_finance_bank', function (Blueprint $table) {
            $table->id();

            // BASIC
            $table->string('code')->unique();
            $table->string('name');

            // ACCOUNT INFO
            $table->string('account_name')->nullable();
            $table->string('account_number')->nullable();

            // RELATION
            $table->foreignId('currency_id')
                ->nullable()
                ->constrained('mst_finance_currency')
                ->nullOnDelete();

            $table->foreignId('coa_id')
                ->nullable()
                ->constrained('mst_finance_chart_account')
                ->nullOnDelete();

            // EXTRA
            $table->string('branch')->nullable();

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
        Schema::dropIfExists('mst_finance_bank');
    }
};
