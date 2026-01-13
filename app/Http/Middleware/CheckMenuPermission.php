<?php

namespace App\Http\Middleware;

use App\Models\Menu;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Symfony\Component\HttpFoundation\Response;

class CheckMenuPermission
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = $request->user();

        if (!$user) {
            abort(403);
        }

        $routeName = Route::currentRouteName();

        $menu = Menu::where('route', $routeName)->first();

        if (!$menu) {
            return $next($request);
        }

        $hasPermission = $user->menuPermissions()
            ->where('menu_id', $menu->id)
            ->exists();

        if (!$hasPermission) {
            abort(403, 'Anda tidak memiliki akses ke menu ini');
        }

        return $next($request);
    }
}
