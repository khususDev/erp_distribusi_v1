<?php

namespace App\Models\Master\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerCategory extends Model
{
    use HasFactory;

    protected $table = 'mst_sales_customer_category';

    protected $fillable = [
        'code',
        'name',
        'description',
        'is_active',
    ];

    // scope standar (kamu sudah sering pakai)
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }
}
