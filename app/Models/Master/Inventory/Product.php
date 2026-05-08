<?php

namespace App\Models\Master\Inventory;

use App\Models\Master\Finance\Tax;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'mst_inventory_product';

    protected $fillable = [
        'code',
        'name',
        'barcode',
        'category_id',
        'brand_id',
        'type',
        'min_stock',
        'max_stock',
        'purchase_price',
        'selling_price',
        'tax_id',
        'is_active',
        'description',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function uoms()
    {
        return $this->hasMany(ProductUom::class);
    }

    public function tax()
    {
        return $this->belongsTo(Tax::class);
    }
}
