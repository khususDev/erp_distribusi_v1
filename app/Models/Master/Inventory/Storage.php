<?php

namespace App\Models\Master\Inventory;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Storage extends Model
{
    use HasFactory;

    use HasFactory;

    protected $table = 'mst_storage';

    protected $fillable = [
        'code',
        'name',
        'warehouse_id',
        'description',
        'is_active',
    ];

    /* ================= RELATION ================= */
    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class);
    }

    /* ================= SCOPE ================= */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public function parent()
    {
        return $this->belongsTo(Storage::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(Storage::class, 'parent_id');
    }
}
