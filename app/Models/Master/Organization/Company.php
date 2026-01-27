<?php

namespace App\Models\Master\Organization;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    use HasFactory;

    protected $table = 'company';

    protected $fillable = [
        'name',
        'code',
        'address',
        'phone',
        'email',
        'is_active',
    ];
}
