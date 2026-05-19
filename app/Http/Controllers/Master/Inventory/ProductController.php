<?php

namespace App\Http\Controllers\Master\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Master\Finance\Tax;
use App\Models\Master\Inventory\Brand;
use App\Models\Master\Inventory\Category;
use App\Models\Master\Inventory\Product;
use App\Models\Master\Inventory\Uom;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Vinkla\Hashids\Facades\Hashids;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $entries = $request->entries ?? 10;

        $products = Product::with(['category', 'brand', 'uom', 'tax'])
            ->orderBy('name')
            ->when($request->search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%")
                        ->orWhere('sku', 'like', "%{$search}%");
                });
            })
            ->when($request->status !== null && $request->status !== '', function ($query) use ($request) {
                $query->where('is_active', $request->status);
            })
            ->paginate($entries)
            ->appends($request->query());

        return Inertia::render('Master/Inventory/Product/Index', [
            'products' => $products,
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
        return Inertia::render('Master/Inventory/Product/Create', [
            'categories' => Category::select('id', 'name')->get(),
            'brands' => Brand::select('id', 'name')->get(),
            'uoms' => Uom::select('id', 'name')->get(),
            'taxes' => Tax::select('id', 'name')->get(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'sku' => 'required|unique:mst_inventory_product,sku',
            'name' => 'required',

            'category_id' => 'nullable|exists:mst_inventory_product_category,id',
            'brand_id' => 'nullable|exists:mst_inventory_brand,id',
            'uom_id' => 'nullable|exists:mst_inventory_uom,id',
            'tax_id' => 'nullable|exists:mst_finance_tax,id',
        ]);

        Product::create($request->all());

        return redirect()
            ->route('mst_inv_product')
            ->with('success', 'Product berhasil ditambahkan');
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
    public function edit($hash)
    {
        // Decode hasilnya
        $decoded = Hashids::decode($hash);

        if (empty($decoded)) {
            abort(404);
        }

        $real_id = $decoded[0];

        $product = Product::with('productUoms.uom')
            ->findOrFail($real_id);

        return Inertia::render('Master/Inventory/Product/Edit', [
            'product' => $product,

            'categories' => Category::select('id', 'name')->get(),
            'brands' => Brand::select('id', 'name')->get(),
            'uoms' => Uom::select('id', 'name')->get(),
            'taxes' => Tax::select('id', 'name')->get(),
        ]);
    }

    public function update(Request $request, $hash) // Ganti parameter jadi $hash
    {
        $decoded = Hashids::decode($hash);
        if (empty($decoded))
            abort(404);

        $product = Product::findOrFail($decoded[0]);

        $validated = $request->validate([
            'sku' => 'required|unique:mst_inventory_product,sku,' . $product->id,
            'name' => 'required',
            'category_id' => 'nullable|exists:mst_inventory_product_category,id',
            'brand_id' => 'nullable|exists:mst_inventory_brand,id',
            'uom_id' => 'nullable|exists:mst_inventory_uom,id',
            'tax_id' => 'nullable|exists:mst_finance_tax,id',
        ]);

        $product->update($request->all());

        return redirect()
            ->route('mst_inv_product')
            ->with('success', 'Product berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($hash) // Ganti parameter jadi $hash
    {
        $decoded = Hashids::decode($hash);
        if (empty($decoded))
            abort(404);

        $product = Product::findOrFail($decoded[0]);
        $product->update(['is_active' => false]);

        return back()->with('success', 'Product dinonaktifkan');
    }
}
