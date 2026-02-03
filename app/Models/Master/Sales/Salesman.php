<?php

namespace App\Models\Master\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Salesman extends Model
{
    use HasFactory;

    protected $table = 'mst_sales_salesman';

    protected $fillable = [
        'code',
        'name',
        'phone',
        'email',
        'is_active',
    ];
}
