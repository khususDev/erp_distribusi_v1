<?php

namespace App\Http\Controllers\Master\Sales;

use App\Http\Controllers\Controller;
use App\Models\Master\Sales\Salesman;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SalesmanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Master/Sales/Salesman/Index', [
            'salesmens' => Salesman::orderBy('name')->get(),
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
            'code' => 'required|unique:mst_sales_salesman,code',
            'name' => 'required',
        ]);

        Salesman::create($request->all());

        return redirect()->back()->with('success', 'Salesman berhasil ditambahkan');
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
    public function update(Request $request, Salesman $salesman)
    {
        $salesman = Salesman::findOrFail($salesman->id);

        $request->validate([
            'code' => 'required|unique:mst_sales_salesman,code,' . $salesman->id,
            'name' => 'required',
        ]);

        $salesman->update($request->all());

        return redirect()->back()->with('success', 'Salesman berhasil diupdate');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Salesman $salesman)
    {
        $salesman->update(['is_active' => false]);
    }
}
