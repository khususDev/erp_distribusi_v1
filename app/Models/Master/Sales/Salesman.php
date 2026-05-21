<?php

namespace App\Models\Master\Sales;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Master\Sales\Area;

class Salesman extends Model
{
    use HasFactory;

    protected $table = 'mst_sales_salesman';

    protected $fillable = [
        'code',
        'name',
        'phone',
        'email',
        'sales_area_id',
        'commission_percent',
        'description',
        'is_active',
    ];

    protected $casts = [
        'commission_percent' => 'decimal:2',
        'is_active' => 'boolean',
    ];

    public function salesarea()
    {
        return $this->belongsTo(Area::class, 'sales_area_id');
    }

    /*
    |--------------------------------------------------------------------------
    | SCOPE
    |--------------------------------------------------------------------------
    */

    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }
}
