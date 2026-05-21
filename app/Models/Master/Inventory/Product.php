<?php

namespace App\Models\Master\Inventory;

use App\Models\Master\Finance\Tax;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Vinkla\Hashids\Facades\Hashids;
use App\Models\Master\Inventory\ProductUom;

class Product extends Model
{
    use HasFactory;

    protected $table = 'mst_inventory_product';

    protected $fillable = [
        'sku',
        'name',
        'barcode',

        'category_id',
        'brand_id',
        'uom_id',
        'tax_id',

        'type',
        'track_stock',

        'is_sellable',
        'is_purchaseable',
        'is_active',

        'min_stock',
        'max_stock',

        'purchase_price',
        'selling_price',

        'description',
    ];

    // 1. Beritahu Laravel untuk selalu menyertakan atribut buatan ini
    protected $appends = ['hash_id'];

    // 2. Buat fungsinya
    public function getHashIdAttribute()
    {
        return Hashids::encode($this->id);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function uom()
    {
        return $this->belongsTo(Uom::class);
    }
    public function tax()
    {
        return $this->belongsTo(Tax::class);
    }
    public function productUoms()
    {
        return $this->hasMany(ProductUom::class);
    }
}
