<?php

namespace App\Http\Controllers\Master\Sales;

use App\Http\Controllers\Controller;
use App\Models\Master\Finance\Currency;
use App\Models\Master\Finance\PaymentTerm;
use App\Models\Master\Organization\Location;
use App\Models\Master\Sales\Area;
use App\Models\Master\Sales\Customer;
use App\Models\Master\Sales\CustomerCategory;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $customers = Customer::with([
            'category',
            'salesArea',
            'paymentTerm',
            'currency'
        ])

            ->when($request->search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('code', 'like', "%{$search}%")
                        ->orWhere('name', 'like', "%{$search}%");
                });
            })

            ->when($request->status !== null && $request->status !== '', function ($query) use ($request) {
                $query->where('is_active', $request->status);
            })

            ->orderBy('name')
            ->paginate($entries)
            ->appends($request->query());

        return Inertia::render('Master/Sales/Customer/Index', [
            'customers' => $customers,

            'categories' => CustomerCategory::active()
                ->select('id', 'name')
                ->orderBy('name')
                ->get(),

            'areas' => Area::active()
                ->select('id', 'name')
                ->orderBy('name')
                ->get(),

            'paymentTerms' => PaymentTerm::active()
                ->select('id', 'name')
                ->orderBy('name')
                ->get(),

            'currencies' => Currency::where('is_active', true)
                ->select('id', 'name')
                ->orderBy('name')
                ->get(),

            'filters' => [
                'search' => $request->search,
                'entries' => $entries,
                'status' => $request->status,
            ],
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
        ]);

        Customer::create($request->all());

        return back()->with('success', 'Customer berhasil ditambahkan');
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

        return back()->with('success', 'Customer berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Customer $customer)
    {
        $customer->update(['is_active' => false]);
    }
}
