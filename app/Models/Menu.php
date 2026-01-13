<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $fillable = [
        'name',
        'route',
        'icon',
        'parent_id',
        'order',
        'is_active',
        'is_sidebar',
        'permission',
    ];

    public function children()
    {
        return $this->hasMany(Menu::class, 'parent_id')
            ->where('is_active', 1)
            ->orderBy('order')
            ->with('children'); // recursive (future-proof)
    }

    public function users()
    {
        return $this->belongsToMany(
            User::class,
            'menu_permission'
        );
    }
}
