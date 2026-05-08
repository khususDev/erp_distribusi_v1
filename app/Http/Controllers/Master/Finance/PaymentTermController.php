<?php

namespace App\Http\Controllers\Master\Finance;

use App\Http\Controllers\Controller;
use App\Models\Master\Finance\PaymentTerm;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PaymentTermController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Master/Finance/PaymentTerm/Index', [
            'paymentTerms' => PaymentTerm::orderBy('name')->get(),
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
            'code' => 'required|unique:mst_finance_payment_term,code',
            'name' => 'required',
            'days' => 'required|integer|min:0',
        ]);

        PaymentTerm::create($request->all());

        return back();
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
    public function update(Request $request, PaymentTerm $paymentTerm)
    {
        $request->validate([
            'name' => 'required',
            'days' => 'required|integer|min:0',
        ]);

        $paymentTerm->update($request->all());

        return back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PaymentTerm $paymentTerm)
    {
        $paymentTerm->update([
            'is_active' => false
        ]);

        return back();
    }
}
