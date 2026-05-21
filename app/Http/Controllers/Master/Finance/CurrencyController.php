<?php

namespace App\Http\Controllers\Master\Finance;

use App\Http\Controllers\Controller;
use App\Models\Master\Finance\Currency;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CurrencyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $currencies = Currency::query()

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

        return Inertia::render('Master/Finance/Currency/Index', [
            'currencies' => $currencies,

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
            'code' => 'required|unique:mst_finance_currency,code',
            'name' => 'required',
            'symbol' => 'required',
        ]);

        Currency::create($request->all());

        return back()->with('success', 'Currency berhasil ditambahkan');
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
    public function update(Request $request, Currency $currency)
    {
        $request->validate([
            'code' => 'required|unique:mst_finance_currency,code,' . $currency->id,
            'name' => 'required',
            'symbol' => 'required',
        ]);

        $currency->update($request->all());

        return back()->with('success', 'Currency berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Currency $currency)
    {
        $currency->update([
            'is_active' => false
        ]);
        return back()->with('success', 'Currency berhasil dihapus');
    }
}
