<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Management\MenuPermissionController;
use App\Http\Controllers\Management\UserController;
use App\Http\Controllers\Master\General\DepartmentController as GeneralDepartmentController;
use App\Http\Controllers\Master\General\ProductController as GeneralProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RoleController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;


Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// Route::prefix('master')->middleware(['auth', 'menu.permission'])->group(function () {
//     Route::prefix('general')->group(function () {
//         Route::resource('departments', [GeneralDepartmentController::class, 'index'])->name('mst_gnrl');
//     });
// });


Route::middleware(['auth', 'menu.permission'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::get('/mst_grl_department', [GeneralDepartmentController::class, 'index'])->name('mst_grl_department');
    Route::post('/mst_grl_department', [GeneralDepartmentController::class, 'store']);
    Route::put('/mst_grl_department/{department}', [GeneralDepartmentController::class, 'update']);
    Route::delete('/mst_grl_department/{department}', [GeneralDepartmentController::class, 'destroy']);

    Route::get('/mst_product', [GeneralProductController::class, 'index'])->name('mst_product');

    Route::get('/mng_user', [UserController::class, 'index'])->name('mng_user');

    Route::get('/mng_role', [RoleController::class, 'index'])->name('mng_role');
    Route::post('/mng_role', [RoleController::class, 'store'])->name('mng_role.store');
    Route::put('/mng_role/{role}', [RoleController::class, 'update'])->name('mng_role.update');
    Route::delete('/mng_role/{role}', [RoleController::class, 'destroy'])->name('mng_role.destroy');

    Route::get('/mng_menupermission', [MenuPermissionController::class, 'index'])->name('mng_menupermission');
    Route::get('/mng_menupermission/{user}/menus', [MenuPermissionController::class, 'edit'])->name('mng_menupermission.edit');
    Route::post('/mng_menupermission/{user}/menus', [MenuPermissionController::class, 'update'])->name('mng_menupermission.update');
});

require __DIR__ . '/auth.php';
