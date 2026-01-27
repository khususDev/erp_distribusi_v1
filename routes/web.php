<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Management\MenuPermissionController;
use App\Http\Controllers\Management\UserController;
use App\Http\Controllers\Management\RoleController;
use App\Http\Controllers\Master\Organization\CompanyController;
use App\Http\Controllers\Master\Organization\DepartmentController as OrganizationDepartmentController;
use App\Http\Controllers\Master\Organization\LocationController as OrganizationLocationController;
use App\Http\Controllers\Master\Inventory\UomController as InventoryUomController;
use App\Http\Controllers\Master\Finance\CurrencyController as FinanceCurrencyController;
use App\Http\Controllers\Master\Finance\PaymentMethodController as FinancePaymentMethodController;
use App\Http\Controllers\Master\Finance\TaxController as FinanceTaxController;
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

// Route::prefix('master')->middleware(['auth', 'menu.permission'])->group(function () {
//     Route::prefix('general')->group(function () {
//         Route::resource('departments', [GeneralDepartmentController::class, 'index'])->name('mst_gnrl');
//     });
// });

Route::prefix('master/organization')->group(function () {
    Route::get('/company', [CompanyController::class, 'index'])->name('mst_org_company');
    Route::post('/company', [CompanyController::class, 'store']);
    Route::put('/company/{company}', [CompanyController::class, 'update']);
    Route::delete('/company/{company}', [CompanyController::class, 'destroy']);
});


Route::middleware(['auth', 'menu.permission'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::get('/mst_grl_department', [OrganizationDepartmentController::class, 'index'])->name('mst_grl_department');
    Route::post('/mst_grl_department', [OrganizationDepartmentController::class, 'store']);
    Route::put('/mst_grl_department/{department}', [OrganizationDepartmentController::class, 'update']);
    Route::delete('/mst_grl_department/{department}', [OrganizationDepartmentController::class, 'destroy']);

    Route::get('/mst_grl_location', [OrganizationLocationController::class, 'index'])->name('mst_grl_location');
    Route::post('/mst_grl_location', [OrganizationLocationController::class, 'store']);
    Route::put('/mst_grl_location/{location}', [OrganizationLocationController::class, 'update']);
    Route::delete('/mst_grl_location/{location}', [OrganizationLocationController::class, 'destroy']);

    Route::get('/mst_grl_uom', [InventoryUomController::class, 'index'])->name('mst_grl_uom');
    Route::post('/mst_grl_uom', [InventoryUomController::class, 'store']);
    Route::put('/mst_grl_uom/{uom}', [InventoryUomController::class, 'update']);
    Route::delete('/mst_grl_uom/{uom}', [InventoryUomController::class, 'destroy']);

    Route::get('/mst_grl_currency', [FinanceCurrencyController::class, 'index'])->name('mst_grl_currency');
    Route::post('/mst_grl_currency', [FinanceCurrencyController::class, 'store']);
    Route::put('/mst_grl_currency/{currency}', [FinanceCurrencyController::class, 'update']);
    Route::delete('/mst_grl_currency/{currency}', [FinanceCurrencyController::class, 'destroy']);

    Route::get('/mst_grl_payment_method', [FinancePaymentMethodController::class, 'index'])->name('mst_grl_payment_method');
    Route::post('/mst_grl_payment_method', [FinancePaymentMethodController::class, 'store']);
    Route::put('/mst_grl_payment_method/{paymentMethod}', [FinancePaymentMethodController::class, 'update']);
    Route::delete('/mst_grl_payment_method/{paymentMethod}', [FinancePaymentMethodController::class, 'destroy']);

    Route::get('/mst_grl_tax', [FinanceTaxController::class, 'index'])->name('mst_grl_tax');
    Route::post('/mst_grl_tax', [FinanceTaxController::class, 'store']);
    Route::put('/mst_grl_tax/{tax}', [FinanceTaxController::class, 'update']);
    Route::delete('/mst_grl_tax/{tax}', [FinanceTaxController::class, 'destroy']);

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
