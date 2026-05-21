<?php

namespace App\Models\Master\Finance;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChartAccount extends Model
{
    use HasFactory;

    protected $table = 'mst_finance_chart_account';

    protected $fillable = [
        'code',
        'name',
        'type',
        'parent_id',
        'level',
        'is_header',
        'is_active',
        'description',
    ];

    protected $casts = [
        'is_header' => 'boolean',
        'is_active' => 'boolean',
    ];

    /*
    |--------------------------------------------------------------------------
    | RELATION
    |--------------------------------------------------------------------------
    */

    public function parent()
    {
        return $this->belongsTo(ChartAccount::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(ChartAccount::class, 'parent_id');
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
