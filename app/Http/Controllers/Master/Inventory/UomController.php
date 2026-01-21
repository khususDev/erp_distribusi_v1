<?php

namespace App\Http\Controllers\Master\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Master\Inventory\Uom;
use Illuminate\Http\Request;
use Inertia\Inertia;

class UomController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Master/Inventory/UOM/Index', [
            'uoms' => Uom::orderBy('name')->get(),
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
            'code' => 'required|unique:uom,code',
            'name' => 'required',
        ]);

        Uom::create($request->all());

        return back()->with('success', 'UOM berhasil ditambahkan');
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
    public function update(Request $request, Uom $uom)
    {
        $request->validate([
            'name' => 'required',
            'code' => 'required|unique:uom,code,' . $uom->id,
        ]);

        $uom->update($request->all());

        return back()->with('success', 'UOM berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Uom $uom)
    {
        $uom->delete();
        return back()->with('success', 'UOM berhasil dihapus');
    }
}
