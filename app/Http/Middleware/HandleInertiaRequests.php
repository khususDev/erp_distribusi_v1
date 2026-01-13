<?php

namespace App\Http\Middleware;

use App\Models\Menu;
use App\Services\MenuService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Inertia\Middleware;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that is loaded on the first page visit.
     *
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determine the current asset version.
     */
    public function version(Request $request): string|null
    {
        return parent::version($request);
    }

    /**
     * Define the props that are shared by default.
     *
     * @return array<string, mixed>
     */
    public function share(Request $request): array
    {
        return [
            ...parent::share($request),

            'auth' => [
                'user' => $request->user(),
            ],

            'menus' => function () use ($request) {
                $user = $request->user();

                if (!$user) {
                    return [];
                }

                return Menu::whereNull('parent_id')
                    ->where('is_active', 1)
                    ->whereHas(
                        'users',
                        fn($q) =>
                        $q->where('users.id', $user->id)
                    )
                    ->with(['children' => function ($q) use ($user) {
                        $q->where('is_active', 1)
                            ->whereHas(
                                'users',
                                fn($q) =>
                                $q->where('users.id', $user->id)
                            )
                            ->orderBy('order');
                    }])
                    ->orderBy('order')
                    ->get();
            },
        ];
    }
}
