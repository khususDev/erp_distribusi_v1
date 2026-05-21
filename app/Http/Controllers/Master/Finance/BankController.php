<?php

namespace App\Http\Controllers\Master\Finance;

use App\Http\Controllers\Controller;
use App\Models\Master\Finance\Bank;
use App\Models\Master\Finance\ChartAccount;
use App\Models\Master\Finance\Currency;
use Illuminate\Http\Request;
use Inertia\Inertia;

class BankController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $banks = Bank::with(['currency', 'coa'])

            ->when($request->search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%")
                        ->orWhere('code', 'like', "%{$search}%");
                });
            })

            ->paginate($entries)
            ->appends($request->query());

        return Inertia::render('Master/Finance/Bank/Index', [
            'banks' => $banks,

            'currencies' => Currency::active()->get(),

            'coas' => ChartAccount::active()->get(),

            'filters' => [
                'search' => $request->search,
                'entries' => $entries,
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
            'code' => 'required|unique:mst_finance_bank,code',
            'name' => 'required',
        ]);

        Bank::create($request->all());

        return back()->with('success', 'Bank berhasil ditambahkan');
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
    public function update(Request $request, Bank $bank)
    {
        $request->validate([
            'code' => 'required|unique:mst_finance_bank,code,' . $bank->id,
            'name' => 'required',
        ]);

        $bank->update($request->all());

        return back()->with('success', 'Bank berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Bank $bank)
    {
        $bank->update([
            'is_active' => false
        ]);

        return back()->with('success', 'Bank berhasil dinonaktifkan');
    }
}
