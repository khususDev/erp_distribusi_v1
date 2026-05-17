<?php

namespace App\Http\Controllers\Master\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Master\Inventory\Warehouse;
use App\Models\Master\Organization\Location;
use Illuminate\Http\Request;
use Inertia\Inertia;

class WarehouseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $warehouses = Warehouse::with('location')
            // orderBy dikembalikan agar data tetap rapi
            ->orderBy('name')
            ->when($request->search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%")
                        ->orWhere('code', 'like', "%{$search}%");
                });
            })
            ->when($request->status !== null && $request->status !== '', function ($query) use ($request) {
                $query->where('is_active', $request->status);
            })
            ->paginate($entries)
            ->appends($request->query());

        return Inertia::render('Master/Inventory/Warehouse/Index', [
            'warehouses' => $warehouses,

            // Data locations dikembalikan jika Vue component Anda masih membutuhkannya 
            // untuk form dropdown Tambah/Edit Warehouse
            'locations' => Location::select(
                'id',
                'name'
            )->get(),

            'filters' => [
                'search'  => $request->search,
                'entries' => $entries,
                'status'  => $request->status,
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
            'code'        => 'required|unique:mst_inventory_warehouse,code',
            'name'        => 'required',
            'location_id' => 'required',
        ]);

        Warehouse::create($request->all());

        return back()->with('success', 'Warehouse berhasil ditambahkan');
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
    public function update(Request $request, Warehouse $warehouse)
    {
        $request->validate([
            'code'        => 'required|unique:mst_inventory_warehouse,code,' . $warehouse->id,
            'name'        => 'required',
            'location_id' => 'required',
        ]);

        $warehouse->update($request->all());

        return back()->with('success', 'Warehouse berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Warehouse $warehouse)
    {
        $warehouse->update(['is_active' => false]);
        return back()->with('success', 'Warehouse berhasil dinonaktifkan');
    }
}
