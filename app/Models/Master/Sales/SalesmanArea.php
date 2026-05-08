<?php

namespace App\Models\Master\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SalesmanArea extends Model
{
    use HasFactory;
    protected $table = 'mst_sales_salesman_area';

    protected $fillable = [
        'salesman_id',
        'sales_area_id',
        'is_active',
    ];

    public function salesman()
    {
        return $this->belongsTo(Salesman::class);
    }

    public function area()
    {
        return $this->belongsTo(Area::class, 'sales_area_id');
    }
}
