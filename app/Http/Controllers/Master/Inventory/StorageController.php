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
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $storage = Storage::with('warehouse.location')
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

        return Inertia::render('Master/Inventory/Storage/Index', [
            'storages' => $storage,

            // Data locations dikembalikan jika Vue component Anda masih membutuhkannya 
            // untuk form dropdown Tambah/Edit Warehouse
            // 'warehouses'  => Warehouse::active()->orderBy('name')->get(),
            'warehouses' => Warehouse::select(
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
