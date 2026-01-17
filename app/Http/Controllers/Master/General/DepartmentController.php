<?php

namespace App\Http\Controllers\Master\General;

use App\Http\Controllers\Controller;
use App\Models\Master\General\Department;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DepartmentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Master/General/Department/Index', [
            'departments' => Department::orderBy('name')->get(),
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
            'code' => 'required|unique:department',
            'name' => 'required',
        ]);

        Department::create($request->all());

        return back()->with('success', 'Department berhasil ditambahkan');
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
    public function update(Request $request, Department $department)
    {
        $request->validate([
            'code' => 'required|unique:department,code,' . $department->id,
            'name' => 'required',
        ]);

        $department->update($request->all());

        return back()->with('success', 'Department berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Department $department)
    {
        $department->delete();

        return back()->with('success', 'Department berhasil dihapus');
    }
}
