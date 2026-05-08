<?php

namespace App\Http\Controllers\Master\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Master\Inventory\Storage;
use App\Models\Master\Inventory\Warehouse;
use Illuminate\Http\Request;
use Inertia\Inertia;

class StorageController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Master/Inventory/Storage/Index', [
            'storages'   => Storage::with('warehouse')->orderBy('name')->get(),
            'warehouses' => Warehouse::active()->orderBy('name')->get(),
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
            'code'         => 'required|unique:mst_inventory_storage,code',
            'name'         => 'required',
            'warehouse_id' => 'required',
        ]);

        Storage::create($request->all());
        return back()->with('success', 'Storage berhasil ditambahkan');
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
    public function update(Request $request, Storage $storage)
    {
        $request->validate([
            'code'         => 'required|unique:mst_inventory_storage,code,' . $storage->id,
            'name'         => 'required',
            'warehouse_id' => 'required',
        ]);

        $storage->update($request->all());
        return back()->with('success', 'Storage berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Storage $storage)
    {
        $storage->update(['is_active' => false]);
        return back()->with('success', 'Storage berhasil dinonaktifkan');
    }
}
