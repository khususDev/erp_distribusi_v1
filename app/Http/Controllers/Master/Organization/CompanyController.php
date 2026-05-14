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
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $companies = Company::query()

            ->when($request->search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%")
                        ->orWhere('code', 'like', "%{$search}%")
                        ->orWhere('email', 'like', "%{$search}%");
                });
            })

            ->when($request->status !== null && $request->status !== '', function ($query) use ($request) {
                $query->where('is_active', $request->status);
            })

            ->paginate($entries)
            ->appends($request->query());

        return Inertia::render('Master/Organization/Company/Index', [
            'companies' => $companies,

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
            'name' => 'required',
            'code' => 'required|unique:mst_organization_company,code',
            'email' => 'required|email',
        ], [
            'email.required' => 'Email wajib diisi bos!',
            'email.email'    => 'Format emailnya salah itu.',
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
            'code' => 'required|unique:mst_organization_company,code,' . $company->id,
            'email' => 'required|email',
        ], [
            'email.required' => 'Email wajib diisi bos!',
            'email.email'    => 'Format emailnya salah itu.',
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
