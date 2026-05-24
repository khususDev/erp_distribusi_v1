<?php

namespace App\Models\Management;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MenuGroup extends Model
{
    use HasFactory;

    protected $table = 'menus_group';

    protected $fillable = [
        'name',
        'no_urut',
        'status',
    ];

    public function menus()
    {
        return $this->hasMany(Menu::class, 'group_menu_id')
            ->whereNull('parent_id')
            ->orderBy('order');
    }
}
