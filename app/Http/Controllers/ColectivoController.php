<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreColectivoRequest;
use App\Models\colectivo;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

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
    public function store(StoreColectivoRequest $request) : RedirectResponse
    {
        $validatedData = $request->validated();

    Colectivo::create([
        'nro_colectivo' => $validatedData['nro_colectivo'],
        'cant_butacas' => $validatedData['cant_butacas'],
        'estado' => '1',
        'servicios' => $request->input('servicios') ?? '',
    ]);

    return redirect()->route('colectivos.index')->with('success', 'Colectivo creado correctamente.');
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

    public function datosColectivo(Request $request){
        $query = Colectivo::query();

        $total = $query->count();

         // Búsqueda global, o sea por todas las columas
        if ($search = $request->input('search.value')) {
            $query->where(function ($q) use ($search) {
                $q->where('id', 'like', "%{$search}%")
                    ->orWhere('nro_colectivo', 'like', "%{$search}%")
                    ->orWhere('cant_butacas', 'like', "%{$search}%");
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
