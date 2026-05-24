<?php

namespace App\Http\Middleware;

use App\Models\Management\Menu;
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
            'flash' => [
                'success' => fn() => $request->session()->get('success'),
                'error' => fn() => $request->session()->get('error'),
            ],

            // UPDATE BAGIAN INI
            'menus' => function () use ($request) {
                $user = $request->user();

                if (!$user) {
                    return [];
                }

                // 1. Ambil MenuGroup yang aktif
                $groups = \App\Models\Management\MenuGroup::where('status', 1)
                    ->orderBy('no_urut')
                    ->with(['menus' => function ($query) use ($user) {
                        // 2. Ambil Menu utama yang diizinkan untuk user ini
                        $query->where('is_active', 1)
                            ->whereHas('users', fn($q) => $q->where('users.id', $user->id))
                            ->with(['children' => function ($q) use ($user) {
                                // 3. Ambil Sub-menu yang diizinkan untuk user ini
                                $q->where('is_active', 1)
                                    ->whereHas('users', fn($q) => $q->where('users.id', $user->id))
                                    ->orderBy('order');
                            }])
                            ->orderBy('order');
                    }])
                    ->get();

                // 4. Format outputnya agar sesuai dengan yang diharapkan Vue,
                // dan buang grup yang tidak memiliki menu (kosong karena filter permission)
                return $groups->map(function ($group) {
                    return [
                        'id' => $group->id,
                        'group_name' => $group->name,
                        'menus' => $group->menus,
                    ];
                })->filter(function ($group) {
                    return count($group['menus']) > 0; // Sembunyikan grup jika menunya 0
                })->values();
            },
        ];
    }
}
