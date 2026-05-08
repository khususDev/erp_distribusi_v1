<?php

namespace App\Http\Controllers\Master\Sales;

use App\Http\Controllers\Controller;
use App\Models\Master\Sales\Area;
use App\Models\Master\Sales\Salesman;
use App\Models\Master\Sales\SalesmanArea;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SalesmanAreaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Master/Sales/SalesmanArea/Index', [
            'data' => SalesmanArea::with(['salesman', 'area'])->get(),
            'salesmen' => Salesman::where('is_active', true)->get(),
            'areas' => Area::where('is_active', true)->get(),
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
            'salesman_id' => 'required',
            'sales_area_id' => 'required',
        ]);

        SalesmanArea::create([
            'salesman_id' => $request->salesman_id,
            'sales_area_id' => $request->sales_area_id,
            'is_active' => true,
        ]);

        return redirect()->back();
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
    public function update(Request $request, SalesmanArea $salesmanArea)
    {
        $salesmanArea->update([
            'is_active' => $request->is_active,
        ]);

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SalesmanArea $salesmanArea)
    {
        $salesmanArea->update(['is_active' => false]);
        return redirect()->back();
    }
}
