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

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return inertia('Master/Inventory/Product/Index', [
            'products' => Product::with([
                'category',
                'brand',
            ])->orderBy('name')->get(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('Master/Inventory/Product/Create', [
            'categories' => Category::active()->get(),
            'brands'     => Brand::active()->get(),
            'uoms'       => Uom::active()->get(),
            'taxes'      => Tax::active()->get(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'category_id' => 'required',
        ]);

        $product = Product::create([
            'code' => $request->code,
            'name' => $request->name,
            'category_id' => $request->category_id,
            'brand_id' => $request->brand_id,
            'is_active' => true,
        ]);

        // simpan multi uom (kalau masih dipakai)
        foreach ($request->uoms ?? [] as $uom) {
            $product->uoms()->create($uom);
        }

        return redirect()->to('/mst_inv_product');
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
    public function edit(string $id, Product $product)
    {
        return Inertia::render('Inventory/Product/Edit', [
            'product'    => $product,
            'categories' => Category::active()->get(),
            'brands'     => Brand::active()->get(),
            'uoms'       => Uom::active()->get(),
            'taxes'      => Tax::active()->get(),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id, Product $product)
    {
        $request->validate([
            'code' => 'required|unique:products,code,' . $product->id,
            'name' => 'required',
        ]);

        $product->update($request->all());

        return redirect()->route('products.index')
            ->with('success', 'Product berhasil diupdate');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id, Product $product)
    {
        $product->update(['is_active' => false]);

        return back()->with('success', 'Product dinonaktifkan');
    }
}
