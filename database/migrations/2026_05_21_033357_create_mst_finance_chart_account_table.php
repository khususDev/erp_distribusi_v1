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
        Schema::create('mst_finance_chart_account', function (Blueprint $table) {
            $table->id();

            $table->string('code')->unique();
            $table->string('name');

            $table->enum('type', [
                'asset',
                'liability',
                'equity',
                'revenue',
                'expense'
            ]);

            $table->foreignId('parent_id')
                ->nullable()
                ->constrained('mst_finance_chart_account')
                ->nullOnDelete();

            $table->integer('level')->default(1);
            $table->boolean('is_header')->default(false);
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
        Schema::dropIfExists('mst_finance_chart_account');
    }
};
