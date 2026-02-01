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
    public function index()
    {
        return Inertia::render('Master/Inventory/Warehouse/Index', [
            'warehouses' => Warehouse::with('location')->orderBy('name')->get(),
            'locations'  => Location::active()->orderBy('name')->get(),
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
            'code'        => 'required|unique:mst_warehouse,code',
            'name'        => 'required',
            'location_id' => 'required',
        ]);

        Warehouse::create($request->all());

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
    public function update(Request $request, Warehouse $warehouse)
    {
        $request->validate([
            'code'        => 'required|unique:mst_warehouse,code,' . $warehouse->id,
            'name'        => 'required',
            'location_id' => 'required',
        ]);

        $warehouse->update($request->all());

        return back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Warehouse $warehouse)
    {
        $warehouse->update(['is_active' => false]);
        return back();
    }
}
