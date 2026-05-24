<?php

namespace App\Http\Controllers\Master\Sales;

use App\Http\Controllers\Controller;
use App\Models\Master\Sales\Area;
use App\Models\Master\Sales\MappingArea;
use App\Models\Master\Sales\Salesman;
use Illuminate\Http\Request;
use Inertia\Inertia;

class MappingAreaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $mappingAreas = MappingArea::with([
            'salesman',
            'area'
        ])

            ->when($request->search, function ($query, $search) {
                $query->whereHas('salesman', function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%");
                })

                    ->orWhereHas('area', function ($q) use ($search) {
                        $q->where('name', 'like', "%{$search}%");
                    });
            })

            ->paginate($entries)
            ->appends($request->query());

        return Inertia::render('Master/Sales/MappingArea/Index', [
            'mappingAreas' => $mappingAreas,

            'salesmen' => Salesman::active()
                ->select('id', 'name')
                ->orderBy('name')
                ->get(),

            'areas' => Area::active()
                ->select('id', 'name')
                ->orderBy('name')
                ->get(),

            'filters' => [
                'search' => $request->search,
                'entries' => $entries,
            ],
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'salesman_id' => 'required',
            'area_id' => 'required',
        ]);

        MappingArea::create($request->all());

        return back()->with('success', 'Mapping area berhasil ditambahkan');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, MappingArea $mappingArea)
    {
        $request->validate([
            'salesman_id' => 'required',
            'area_id' => 'required',
        ]);

        $mappingArea->update($request->all());

        return back()->with('success', 'Mapping area berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(MappingArea $mappingArea)
    {
        $mappingArea->update([
            'is_active' => false
        ]);

        return back()->with('success', 'Mapping area berhasil dihapus');
    }
}
