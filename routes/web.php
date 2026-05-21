<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Management\MenuPermissionController;
use App\Http\Controllers\Management\UserController;
use App\Http\Controllers\Management\RoleController;
use App\Http\Controllers\Master\Finance\BankController;
use App\Http\Controllers\Master\Finance\ChartAccountController;
use App\Http\Controllers\Master\Organization\CompanyController;
use App\Http\Controllers\Master\Organization\DepartmentController;
use App\Http\Controllers\Master\Organization\LocationController;
use App\Http\Controllers\Master\Inventory\UomController;
use App\Http\Controllers\Master\Inventory\CategoryController;
use App\Http\Controllers\Master\Finance\CurrencyController;
use App\Http\Controllers\Master\Finance\PaymentMethodController;
use App\Http\Controllers\Master\Finance\PaymentTermController;
use App\Http\Controllers\Master\Finance\TaxController;
use App\Http\Controllers\Master\Inventory\BrandController;
use App\Http\Controllers\Master\Inventory\ProductController;
use App\Http\Controllers\Master\Inventory\StorageController;
use App\Http\Controllers\Master\Inventory\WarehouseController;
use App\Http\Controllers\Master\Sales\AreaController;
use App\Http\Controllers\Master\Sales\CustomerCategoryController;
use App\Http\Controllers\Master\Sales\CustomerController;
use App\Http\Controllers\Master\Sales\SalesmanAreaController;
use App\Http\Controllers\Master\Sales\SalesmanController;
use App\Http\Controllers\ProfileController;
use App\Models\Master\Sales\CustomerCategory;
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

// Route::prefix('master/organization')->group(function () {
//     Route::get('/company', [CompanyController::class, 'index'])->name('mst_org_company');
//     Route::post('/company', [CompanyController::class, 'store']);
//     Route::put('/company/{company}', [CompanyController::class, 'update']);
//     Route::delete('/company/{company}', [CompanyController::class, 'destroy']);
// });


Route::middleware(['auth', 'menu.permission'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::get('/mst_grl_company', [CompanyController::class, 'index'])->name('mst_grl_company');
    Route::post('/mst_grl_company', [CompanyController::class, 'store']);
    Route::put('/mst_grl_company/{company}', [CompanyController::class, 'update']);
    Route::delete('/mst_grl_company/{company}', [CompanyController::class, 'destroy']);

    Route::get('/mst_grl_department', [DepartmentController::class, 'index'])->name('mst_grl_department');
    Route::post('/mst_grl_department', [DepartmentController::class, 'store']);
    Route::put('/mst_grl_department/{department}', [DepartmentController::class, 'update']);
    Route::delete('/mst_grl_department/{department}', [DepartmentController::class, 'destroy']);

    Route::get('/mst_grl_location', [LocationController::class, 'index'])->name('mst_grl_location');
    Route::post('/mst_grl_location', [LocationController::class, 'store']);
    Route::put('/mst_grl_location/{location}', [LocationController::class, 'update']);
    Route::delete('/mst_grl_location/{location}', [LocationController::class, 'destroy']);

    Route::get('/mst_inv_uom', [UomController::class, 'index'])->name('mst_inv_uom');
    Route::post('/mst_inv_uom', [UomController::class, 'store']);
    Route::put('/mst_inv_uom/{uom}', [UomController::class, 'update']);
    Route::delete('/mst_inv_uom/{uom}', [UomController::class, 'destroy']);

    Route::get('/mst_inv_brand', [BrandController::class, 'index'])->name('mst_inv_brand');
    Route::post('/mst_inv_brand', [BrandController::class, 'store']);
    Route::put('/mst_inv_brand/{brand}', [BrandController::class, 'update']);
    Route::delete('/mst_inv_brand/{brand}', [BrandController::class, 'destroy']);

    Route::get('/mst_inv_category', [CategoryController::class, 'index'])->name('mst_inv_category');
    Route::post('/mst_inv_category', [CategoryController::class, 'store']);
    Route::put('/mst_inv_category/{category}', [CategoryController::class, 'update']);
    Route::delete('/mst_inv_category/{category}', [CategoryController::class, 'destroy']);

    Route::get('/mst_inv_product', [ProductController::class, 'index'])->name('mst_inv_product');
    Route::get('/mst_inv_product/create', [ProductController::class, 'create']);
    Route::get('/mst_inv_product/{product}/edit', [ProductController::class, 'edit']);
    Route::post('/mst_inv_product', [ProductController::class, 'store']);
    Route::put('/mst_inv_product/{product}', [ProductController::class, 'update']);
    Route::delete('/mst_inv_product/{product}', [ProductController::class, 'destroy']);

    Route::get('/mst_inv_warehouse', [WarehouseController::class, 'index'])->name('mst_inv_warehouse');
    Route::post('/mst_inv_warehouse', [WarehouseController::class, 'store']);
    Route::put('/mst_inv_warehouse/{warehouse}', [WarehouseController::class, 'update']);
    Route::delete('/mst_inv_warehouse/{warehouse}', [WarehouseController::class, 'destroy']);

    Route::get('/mst_inv_storage', [StorageController::class, 'index'])->name('mst_inv_storage');
    Route::post('/mst_inv_storage', [StorageController::class, 'store']);
    Route::put('/mst_inv_storage/{storage}', [StorageController::class, 'update']);
    Route::delete('/mst_inv_storage/{storage}', [StorageController::class, 'destroy']);

    Route::get('/mst_fin_currency', [CurrencyController::class, 'index'])->name('mst_fin_currency');
    Route::post('/mst_fin_currency', [CurrencyController::class, 'store']);
    Route::put('/mst_fin_currency/{currency}', [CurrencyController::class, 'update']);
    Route::delete('/mst_fin_currency/{currency}', [CurrencyController::class, 'destroy']);

    Route::get('/mst_fin_payment_method', [PaymentMethodController::class, 'index'])->name('mst_fin_payment_method');
    Route::post('/mst_fin_payment_method', [PaymentMethodController::class, 'store']);
    Route::put('/mst_fin_payment_method/{paymentMethod}', [PaymentMethodController::class, 'update']);
    Route::delete('/mst_fin_payment_method/{paymentMethod}', [PaymentMethodController::class, 'destroy']);

    Route::get('/mst_fin_tax', [TaxController::class, 'index'])->name('mst_fin_tax');
    Route::post('/mst_fin_tax', [TaxController::class, 'store']);
    Route::put('/mst_fin_tax/{tax}', [TaxController::class, 'update']);
    Route::delete('/mst_fin_tax/{tax}', [TaxController::class, 'destroy']);

    Route::get('/mst_fin_payment_term', [PaymentTermController::class, 'index'])->name('mst_fin_payment_term');
    Route::post('/mst_fin_payment_term', [PaymentTermController::class, 'store']);
    Route::put('/mst_fin_payment_term/{paymentTerm}', [PaymentTermController::class, 'update']);
    Route::delete('/mst_fin_payment_term/{paymentTerm}', [PaymentTermController::class, 'destroy']);

    Route::get('/mst_fin_chart_account', [ChartAccountController::class, 'index'])->name('mst_fin_chart_account');
    Route::post('/mst_fin_chart_account', [ChartAccountController::class, 'store']);
    Route::put('/mst_fin_chart_account/{chartAccount}', [ChartAccountController::class, 'update']);
    Route::delete('/mst_fin_chart_account/{chartAccount}', [ChartAccountController::class, 'destroy']);

    Route::get('/mst_fin_bank', [BankController::class, 'index'])->name('mst_fin_bank');
    Route::post('/mst_fin_bank', [BankController::class, 'store']);
    Route::put('/mst_fin_bank/{bank}', [BankController::class, 'update']);
    Route::delete('/mst_fin_bank/{bank}', [BankController::class, 'destroy']);

    Route::get('/mst_sls_customer_category', [CustomerCategoryController::class, 'index'])->name('mst_sls_customer_category');
    Route::post('/mst_sls_customer_category', [CustomerCategoryController::class, 'store']);
    Route::put('/mst_sls_customer_category/{customerCategory}', [CustomerCategoryController::class, 'update']);
    Route::delete('/mst_sls_customer_category/{customerCategory}', [CustomerCategoryController::class, 'destroy']);

    Route::get('/mst_sls_customer', [CustomerController::class, 'index'])->name('mst_sls_customer');
    Route::post('/mst_sls_customer', [CustomerController::class, 'store']);
    Route::put('/mst_sls_customer/{customer}', [CustomerController::class, 'update']);
    Route::delete('/mst_sls_customer/{customer}', [CustomerController::class, 'destroy']);

    Route::get('/mst_sls_salesman', [SalesmanController::class, 'index'])->name('mst_sls_salesman');
    Route::post('/mst_sls_salesman', [SalesmanController::class, 'store']);
    Route::put('/mst_sls_salesman/{salesman}', [SalesmanController::class, 'update']);
    Route::delete('/mst_sls_salesman/{salesman}', [SalesmanController::class, 'destroy']);

    Route::get('/mst_sls_area', [AreaController::class, 'index'])->name('mst_sls_area');
    Route::post('/mst_sls_area', [AreaController::class, 'store']);
    Route::put('/mst_sls_area/{area}', [AreaController::class, 'update']);
    Route::delete('/mst_sls_area/{area}', [AreaController::class, 'destroy']);

    Route::get('/mst_sls_salesman_area', [SalesmanAreaController::class, 'index'])->name('mst_sls_salesman_area');
    Route::post('/mst_sls_salesman_area', [SalesmanAreaController::class, 'store']);
    Route::put('/mst_sls_salesman_area/{salesmanArea}', [SalesmanAreaController::class, 'update']);
    Route::delete('/mst_sls_salesman_area/{salesmanArea}', [SalesmanAreaController::class, 'destroy']);

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
