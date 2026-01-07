<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Management\UserController;
use App\Http\Controllers\MasterData\DepartmentController;
use App\Http\Controllers\ProfileController;
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

Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/mst_department', [DepartmentController::class, 'index'])->name('department');
    Route::get('/mst_product', [DepartmentController::class, 'index'])->name('product');
    Route::get('/mng_user', [UserController::class, 'index'])->name('user');
});

require __DIR__ . '/auth.php';
