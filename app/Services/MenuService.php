<?php

namespace App\Services;

use App\Models\Management\Menu;
use Illuminate\Support\Facades\Auth;

// app/Services/MenuService.php
class MenuService
{
    public static function getSidebar()
    {
        $user = Auth::user();

        return Menu::with('children')
            ->whereNull('parent_id')
            ->where('is_active', 1)
            ->orderBy('order')
            ->get()
            ->filter(function ($menu) use ($user) {

                // 🔹 SINGLE MENU (Dashboard, dll)
                if ($menu->route) {
                    return !$menu->permission || $user->can($menu->permission);
                }

                // 🔹 PARENT MENU (tanpa route)
                $menu->children = $menu->children->filter(function ($child) use ($user) {
                    return !$child->permission || $user->can($child->permission);
                });

                return $menu->children->isNotEmpty();
            })
            ->values();
    }
}
