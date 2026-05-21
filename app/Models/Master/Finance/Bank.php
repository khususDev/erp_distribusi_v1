<?php

namespace App\Models\Master\Finance;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bank extends Model
{
    use HasFactory;

    protected $table = 'mst_finance_bank';

    protected $fillable = [
        'code',
        'name',
        'account_name',
        'account_number',
        'currency_id',
        'coa_id',
        'branch',
        'is_active',
        'description',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    /*
    |--------------------------------------------------------------------------
    | RELATION
    |--------------------------------------------------------------------------
    */

    public function currency()
    {
        return $this->belongsTo(Currency::class);
    }

    public function coa()
    {
        return $this->belongsTo(ChartAccount::class, 'coa_id');
    }
}
