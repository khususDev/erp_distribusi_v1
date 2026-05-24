<?php

namespace App\Models\Master\Purchasing;

use App\Models\Master\Finance\Currency;
use App\Models\Master\Finance\PaymentTerm;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    use HasFactory;

    protected $table = 'mst_purchasing_supplier';

    protected $fillable = [
        'code',
        'name',

        'supplier_category_id',
        'payment_term_id',
        'currency_id',

        'phone',
        'email',
        'pic_name',

        'address',
        'city',

        'tax_number',
        'credit_limit',

        'is_active',
        'description',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'credit_limit' => 'decimal:2',
    ];

    /*
    |--------------------------------------------------------------------------
    | RELATION
    |--------------------------------------------------------------------------
    */

    public function category()
    {
        return $this->belongsTo(
            SupplierCategory::class,
            'supplier_category_id'
        );
    }

    public function paymentTerm()
    {
        return $this->belongsTo(PaymentTerm::class);
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class);
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
