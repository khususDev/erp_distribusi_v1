<?php

namespace App\Models\Master\Finance;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    use HasFactory;

    protected $table = 'mst_finance_currency';

    protected $fillable = [
        'code',
        'name',
        'symbol',
        'is_active',
    ];
}
