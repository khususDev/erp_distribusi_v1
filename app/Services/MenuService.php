<?php

namespace App\Services;

use App\Models\Menu;

// app/Services/MenuService.php
class MenuService
{
    public static function sidebar()
    {
        $user = auth()->user();

        return Menu::with('children')
            ->whereNull('parent_id')
            ->where('is_active', 1)
            ->where('is_sidebar', 1)
            ->orderBy('order')
            ->get()
            ->filter(function ($menu) use ($user) {

                // parent tanpa permission → cek child
                if (!$menu->permission) {
                    $menu->children = $menu->children->filter(
                        fn($child) =>
                        !$child->permission || $user->can($child->permission)
                    );
                    return $menu->children->isNotEmpty();
                }

                return $user->can($menu->permission);
            })
            ->values();
    }
}
