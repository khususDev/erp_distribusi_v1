<?php

namespace App\Models\Master\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MappingArea extends Model
{
    use HasFactory;
    protected $table = 'mst_sales_mapping_area';

    protected $fillable = [
        'salesman_id',
        'area_id',
        'is_active',
        'description',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    public function salesman()
    {
        return $this->belongsTo(Salesman::class);
    }

    public function area()
    {
        return $this->belongsTo(Area::class);
    }

    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }
}
