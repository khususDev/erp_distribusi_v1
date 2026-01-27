<?php

namespace App\Http\Controllers\Master\Organization;

use App\Http\Controllers\Controller;
use App\Models\Master\Organization\Company;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Master/Organization/Company/Index', [
            'companies' => Company::orderBy('name')->get(),
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
            'name' => 'required',
            'code' => 'required|unique:companies,code',
        ]);

        Company::create($request->all());

        return back()->with('success', 'Company berhasil ditambahkan');
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
    public function update(Request $request, Company $company)
    {
        $request->validate([
            'name' => 'required',
            'code' => 'required|unique:companies,code,' . $company->id,
        ]);

        $company->update($request->all());

        return back()->with('success', 'Company berhasil diperbarui');
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Company $company)
    {
        $company->delete();

        return back()->with('success', 'Company berhasil dihapus');
    }
}
