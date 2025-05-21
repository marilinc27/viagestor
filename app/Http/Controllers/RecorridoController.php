<?php

namespace App\Http\Controllers;

use App\Models\Recorrido;
use Illuminate\Http\Request;
use App\Models\Provincia;
use Illuminate\Support\Facades\DB;

class RecorridoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $variable = "hola";
        return view("recorridos.index", compact("variable"));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $provincias = Provincia::all();
        return view('recorridos.create', compact("provincias"));
    }

    /**php artisan make:controller ProductoController
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $ciudadesParadas = json_decode($request->ciudadesParadas, true);

        $lastIndex = count($ciudadesParadas);
        $origen = $ciudadesParadas[0]['idOrigen'];
        $destino = $ciudadesParadas[$lastIndex - 1]['idDestino'];

        $idRecorrido = DB::table('recorridos')->insertGetId([
            'id_ciudad_origen' => $origen,
            'id_ciudad_destino' => $destino,
            'estado' => 2,
        ]);

        $j = 1;

        for ($i = 0; $i < count($ciudadesParadas); $i++) {
            $valorDecimal = $ciudadesParadas[$i]['hsTramo'];
            $horas = floor($valorDecimal);
            $minutos = ($valorDecimal - $horas) * 60;
            $intervalo = "{$horas} hours {$minutos} minutes";


            DB::table('paradas')->insert([
                'id_recorrido' => $idRecorrido,
                'id_ciudad_origen' => $ciudadesParadas[$i]['idOrigen'],
                'id_ciudad_destino' => $ciudadesParadas[$i]['idDestino'],
                'orden' => $j,
                'hs_tramo' => $intervalo,
            ]);
            $j++;
        }

    }

    /**
     * Display the specified resource.
     */
    public function show(Recorrido $recorrido)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Recorrido $recorrido)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Recorrido $recorrido)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Recorrido $recorrido)
    {
        //
    }
}
