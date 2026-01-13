<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class UserMenuController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Users/Index', [
            'users' => User::select('id', 'name', 'email')->get(),
        ]);
    }

    public function edit(User $user)
    {
        $menus = Menu::whereNull('parent_id')
            ->with('children')
            ->orderBy('order')
            ->get();

        $userMenuIds = $user->menuPermissions()
            ->pluck('menus.id')
            ->toArray();

        return Inertia::render('Users/MenuPermission', [
            'user' => $user,
            'menus' => $menus,
            'userMenuIds' => $userMenuIds,
        ]);
    }

    public function update(Request $request, User $user)
    {
        $menuIds = $request->input('menu_ids', []);

        // VALIDASI STRICT (ERP STYLE)
        foreach ($menuIds as $menuId) {
            $menu = Menu::with('children')->find($menuId);

            if ($menu && $menu->children->count() > 0) {
                foreach ($menu->children as $child) {
                    if (!in_array($child->id, $menuIds)) {
                        return back()->withErrors([
                            'menu_ids' => 'Parent menu wajib menyertakan semua child.',
                        ]);
                    }
                }
            }
        }

        $user->menuPermissions()->sync($menuIds);

        return redirect()->back()->with('success', 'Permission menu berhasil disimpan');
    }
}
