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
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $customerCategories = CustomerCategory::query()

            ->when($request->search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%")
                        ->orWhere('code', 'like', "%{$search}%");
                });
            })

            ->when($request->status !== null && $request->status !== '', function ($query) use ($request) {
                $query->where('is_active', $request->status);
            })

            ->orderBy('name')
            ->paginate($entries)
            ->appends($request->query());

        return Inertia::render('Master/Sales/CustomerCategory/Index', [
            'customerCategories' => $customerCategories,

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
            'code' => 'required|unique:mst_sales_customer_category,code',
            'name' => 'required',
        ]);

        CustomerCategory::create($request->all());

        return back()->with('success', 'Customer Category berhasil ditambahkan');
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
    public function update(Request $request, $id) // Ubah ke $id agar aman dari mismatch route binding
    {
        // 1. Cari data berdasarkan ID terlebih dahulu
        $customerCategory = CustomerCategory::findOrFail($id);

        // 2. Gunakan ID yang ditemukan untuk pengecualian (validation rule unique)
        $request->validate([
            'code' => 'required|unique:mst_sales_customer_category,code,' . $customerCategory->id,
            'name' => 'required',
        ]);

        // 3. Update data
        $customerCategory->update($request->all());

        return back()->with('success', 'Customer Category berhasil diperbarui');
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id) // Ubah ke $id
    {
        // 1. Cari data berdasarkan ID
        $customerCategory = CustomerCategory::findOrFail($id);

        // 2. Lakukan soft delete / nonaktifkan status
        $customerCategory->update([
            'is_active' => false
        ]);

        return back()->with('success', 'Customer Category berhasil dihapus');
    }
}
