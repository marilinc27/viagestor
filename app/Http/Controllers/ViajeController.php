<?php

namespace App\Http\Controllers;

use App\Models\Provincia;
use App\Models\Viaje;
use Illuminate\Http\Request;

class ViajeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $variable = "hola";
        return view("viajes.index", compact("variable"));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $provincias = Provincia::all();
        return view('viajes.create',compact("provincias"));
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
    public function show(Viaje $viaje)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Viaje $viaje)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Viaje $viaje)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Viaje $viaje)
    {
        //
    }


    public function datosViaje(Request $request)
    {
        $query = Viaje::query();

        $total = $query->count();

        // Búsqueda global, o sea por todas las columas
        if ($search = $request->input('search.value')) {
            $query->where(function ($q) use ($search) {
                $q->where('id', 'like', "%{$search}%")
                    ->orWhere('id_recorrido', 'like', "%{$search}%")
                    ->orWhere('id_colectivo', 'like', "%{$search}%");
            });
        }

        $filtered = $query->count();

        // Ordenar
        $orderColIndex = $request->input('order.0.column');
        $orderDir = $request->input('order.0.dir');
        $orderColName = $request->input("columns.$orderColIndex.data");
        if ($orderColName) {
            $query->orderBy($orderColName, $orderDir);
        }

        // Paginación
        $start = $request->input('start', 0);
        $length = $request->input('length', 10);

        $data = $query->skip($start)->take($length)->get();

        return response()->json([
            'draw' => intval($request->input('draw')),
            'recordsTotal' => $total,
            'recordsFiltered' => $filtered,
            'data' => $data,
        ]);
    }
}
