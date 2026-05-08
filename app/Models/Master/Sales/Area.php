<?php

namespace App\Models\Master\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    use HasFactory;
    protected $table = 'mst_sales_area';

    protected $fillable = [
        'code',
        'name',
        'description',
        'is_active',
    ];
}
