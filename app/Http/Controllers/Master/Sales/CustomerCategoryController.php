<?php

namespace App\Http\Controllers\Master\Sales;

use App\Http\Controllers\Controller;
use App\Models\Master\Sales\CustomerCategory;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CustomerCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Master/Sales/CustomerCategory/Index', [
            'categories' => CustomerCategory::orderBy('name')->get(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'code' => 'required|unique:mst_sales_customer_category,code',
            'name' => 'required',
        ]);

        CustomerCategory::create($request->all());

        return back();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, CustomerCategory $customerCategory)
    {
        $request->validate([
            'name' => 'required',
        ]);

        $customerCategory->update($request->all());

        return back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CustomerCategory $customerCategory)
    {
        $customerCategory->update(['is_active' => false]);
        return back();
    }
}
