<?php

namespace App\Models\Master\Inventory;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductUom extends Model
{
    use HasFactory;

    protected $table = 'mst_inventory_product_uom';

    protected $fillable = [
        'product_id',
        'uom_id',
        'conversion_rate',
        'is_base',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function uom()
    {
        return $this->belongsTo(Uom::class);
    }
}
