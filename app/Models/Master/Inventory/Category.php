<?php

namespace App\Models\Master\Inventory;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $table = 'category';
    protected $fillable = [
        'name',
        'code',
        'description',
        'is_active',
    ];
}
