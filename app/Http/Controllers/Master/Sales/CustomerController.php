<?php

namespace App\Http\Controllers\Master\Sales;

use App\Http\Controllers\Controller;
use App\Models\Master\Organization\Location;
use App\Models\Master\Sales\Customer;
use App\Models\Master\Sales\CustomerCategory;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia('Master/Sales/Customer/Index', [
            'customers' => Customer::with(['category', 'location'])
                ->orderBy('name')
                ->get(),

            'categories' => CustomerCategory::active()->get(),
            'locations' => Location::active()->get(),
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
            'code' => 'required|unique:mst_sales_customer,code',
            'name' => 'required',
            'customer_category_id' => 'required',
        ]);

        Customer::create($request->all());
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
    public function update(Request $request, Customer $customer)
    {
        $request->validate([
            'code' => 'required|unique:mst_sales_customer,code,' . $customer->id,
            'name' => 'required',
        ]);

        $customer->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Customer $customer)
    {
        $customer->update(['is_active' => false]);
    }
}
