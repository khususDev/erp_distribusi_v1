<?php

namespace App\Models\Master\Inventory;

use App\Models\Master\Organization\Location;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Warehouse extends Model
{
    use HasFactory;

    protected $table = 'mst_inventory_warehouse';

    protected $fillable = [
        'code',
        'name',
        'location_id',
        'description',
        'is_active',
    ];

    /* ================== RELATION ================== */
    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    /* ================== SCOPE ================== */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }
}
