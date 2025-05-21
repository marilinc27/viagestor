<?php

namespace App\Http\Controllers;

use App\Models\colectivo;
use Illuminate\Http\Request;

class ColectivoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $variable = "hola";
        return view("colectivos.index", compact("variable"));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('colectivos.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        return redirect('');
    }

    /**
     * Display the specified resource.
     */
    public function show(Colectivo $colectivo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Colectivo $colectivo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Colectivo $colectivo)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Colectivo $colectivo)
    {
        //
    }

}
