<?php

namespace App\Http\Controllers\Master\Finance;

use App\Http\Controllers\Controller;
use App\Models\Master\Finance\ChartAccount;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ChartAccountController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $accounts = ChartAccount::with('parent')

            ->when($request->search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%")
                        ->orWhere('code', 'like', "%{$search}%");
                });
            })

            ->when($request->status !== null && $request->status !== '', function ($query) use ($request) {
                $query->where('is_active', $request->status);
            })

            ->orderBy('code')
            ->paginate($entries)
            ->appends($request->query());

        return Inertia::render('Master/Finance/ChartAccount/Index', [
            'accounts' => $accounts,

            'parentAccounts' => ChartAccount::active()
                ->where('is_header', true)
                ->select('id', 'code', 'name')
                ->orderBy('code')
                ->get(),

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
            'code' => 'required|unique:mst_finance_chart_account,code',
            'name' => 'required',
            'type' => 'required',
        ]);

        ChartAccount::create($request->all());

        return back()->with('success', 'COA berhasil ditambahkan');
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
    public function update(Request $request, ChartAccount $chart_account)
    {

        $request->validate([
            'code' => 'required|unique:mst_finance_chart_account,code,' . $chart_account->id,
            'name' => 'required',
            'type' => 'required',
        ]);

        $chart_account->update($request->all());

        return back()->with('success', 'COA berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ChartAccount $chart_account)
    {
        $chart_account->update([
            'is_active' => false
        ]);

        return back()->with('success', 'COA berhasil dinonaktifkan');
    }
}
