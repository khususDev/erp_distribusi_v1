<?php

namespace App\Http\Controllers\Master\Purchasing;

use App\Http\Controllers\Controller;
use App\Models\Master\Purchasing\SupplierCategory;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SupplierCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $categories = SupplierCategory::query()

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

        return Inertia::render('Master/Purchasing/SupplierCategory/Index', [
            'supplierCategories' => $categories,

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
            'code' => 'required|unique:mst_purchasing_supplier_category,code',
            'name' => 'required',
        ]);

        SupplierCategory::create($request->all());

        return back()->with('success', 'Supplier category berhasil ditambahkan');
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
    public function update(Request $request, SupplierCategory $supplierCategory)
    {
        $request->validate([
            'code' => 'required|unique:mst_purchasing_supplier_category,code,' . $supplierCategory->id,
            'name' => 'required',
        ]);

        $supplierCategory->update($request->all());

        return back()->with('success', 'Supplier category berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SupplierCategory $supplierCategory)
    {
        $supplierCategory->update([
            'is_active' => false
        ]);

        return back()->with('success', 'Supplier category berhasil dihapus');
    }
}
