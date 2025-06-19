<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReporteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function pasajesVendidos()
    {
        $resultados = DB::table('pasajes')
            ->select('fecha_salida', DB::raw('COUNT(*) as cantidad'))
            ->groupBy('fecha_salida')
            ->orderBy('fecha_salida', 'desc')
            ->get();

        return view('reportes.pasajes', compact('resultados'));
    }

    public function destinosPopulares()
    {
        $resultados = DB::table('pasajes as p')
            ->join('paradas as pa', 'p.id_parada_destino', '=', 'pa.id')
            ->join('ciudades as c', 'pa.id_ciudad_destino', '=', 'c.id')
            ->select('c.nombre as ciudad_destino', DB::raw('COUNT(*) as cantidad'))
            ->groupBy('c.nombre')
            ->orderByDesc('cantidad')
            ->get();

        return view('reportes.destinos', compact('resultados'));
    }
}
