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
        Schema::create('mst_sales_salesman', function (Blueprint $table) {
            $table->id();

            $table->string('code')->unique();
            $table->string('name');

            $table->string('phone')->nullable();
            $table->string('email')->nullable();

            $table->foreignId('sales_area_id')
                ->nullable()
                ->constrained('mst_sales_area')
                ->nullOnDelete();

            $table->decimal('commission_percent', 5, 2)
                ->default(0);

            $table->boolean('is_active')
                ->default(true);

            $table->text('description')
                ->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mst_sales_salesman');
    }
};
