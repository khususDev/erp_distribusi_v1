<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Management\UserController;
use App\Http\Controllers\MasterData\DepartmentController;
use App\Http\Controllers\MasterData\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserMenuController;
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

Route::middleware(['auth', 'menu.permission'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/mst_department', [DepartmentController::class, 'index'])->name('mst_department');
    Route::get('/mst_product', [ProductController::class, 'index'])->name('mst_product');

    Route::get('/mng_user', [UserController::class, 'index'])->name('mng_user');

    Route::get('/mng_role', [RoleController::class, 'index'])
        ->name('mng_role');
    Route::post('/mng_role', [RoleController::class, 'store'])
        ->name('mng_role.store');
    Route::put('/mng_role/{role}', [RoleController::class, 'update'])
        ->name('mng_role.update');
    Route::delete('/mng_role/{role}', [RoleController::class, 'destroy'])
        ->name('mng_role.destroy');

    Route::get('/mng_menu', [UserMenuController::class, 'index'])
        ->name('mng_menu');
    Route::get('/mng_menu/{user}/menus', [UserMenuController::class, 'edit'])
        ->name('users.menus.edit');
    Route::post('/mng_menu/{user}/menus', [UserMenuController::class, 'update'])
        ->name('users.menus.update');
});

// Route::get('/department', [DepartmentController::class, 'index'])
//     ->name('department.index')
//     ->middleware('permission:department.view');

require __DIR__ . '/auth.php';
