<?php

namespace App\Http\Controllers\Master\Sales;

use App\Http\Controllers\Controller;
use App\Models\Master\Sales\Area;
use App\Models\Master\Sales\Salesman;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SalesmanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $salesmen = Salesman::with('salesarea')

            ->when($request->search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%")
                        ->orWhere('code', 'like', "%{$search}%")
                        ->orWhere('phone', 'like', "%{$search}%");
                });
            })

            ->when($request->status !== null && $request->status !== '', function ($query) use ($request) {
                $query->where('is_active', $request->status);
            })

            ->orderBy('name')
            ->paginate($entries)
            ->appends($request->query());

        return Inertia::render('Master/Sales/Salesman/Index', [
            'salesmens' => $salesmen,

            'areas' => Area::select(
                'id',
                'name'
            )->get(),

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
            'code' => 'required|unique:mst_sales_salesman,code',
            'name' => 'required',
        ]);

        Salesman::create($request->all());

        return back()->with('success', 'Salesman berhasil ditambahkan');
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
    public function update(Request $request, string $id)
    {

        $salesman = Salesman::findOrFail($id);

        $request->validate([
            'code' => 'required|unique:mst_sales_salesman,code,' . $salesman->id,
            'name' => 'required',
        ]);

        $salesman->update($request->all());

        return back()->with('success', 'Salesman berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Salesman $salesman)
    {
        $salesman->update([
            'is_active' => false
        ]);

        return back()->with('success', 'Salesman berhasil dinonaktifkan');
    }
}
