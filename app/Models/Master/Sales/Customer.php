<?php

namespace App\Models\Master\Sales;

use App\Models\Master\Organization\Location;
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
        'location_id',
        'phone',
        'email',
        'address',
        'is_active',
    ];

    public function category()
    {
        return $this->belongsTo(CustomerCategory::class, 'customer_category_id');
    }

    public function location()
    {
        return $this->belongsTo(Location::class, 'location_id');
    }
}
