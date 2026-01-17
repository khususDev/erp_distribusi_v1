<?php

namespace App\Models\Master\General;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use HasFactory;

    protected $table = 'department';

    protected $fillable = [
        'code',
        'name',
        'description',
        'is_active',
    ];
}
