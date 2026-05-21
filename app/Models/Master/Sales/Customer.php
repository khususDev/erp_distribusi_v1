<?php

namespace App\Models\Master\Sales;

use App\Models\Master\Finance\Currency;
use App\Models\Master\Finance\PaymentTerm;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;

    protected $table = 'mst_sales_customer';

    protected $fillable = [
        'code',
        'name',
        'customer_category_id',
        'sales_area_id',
        'phone',
        'email',
        'address',
        'city',
        'payment_term_id',
        'currency_id',
        'credit_limit',
        'tax_number',
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
        return $this->belongsTo(CustomerCategory::class, 'customer_category_id');
    }

    public function salesArea()
    {
        return $this->belongsTo(Area::class, 'sales_area_id');
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
