<?php

namespace App\Http\Controllers;

use App\Models\Recorrido;
use Illuminate\Http\Request;
use App\Models\Provincia;
use App\Models\Ciudad;
use Illuminate\Support\Facades\DB;

class RecorridoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $recorridos = Recorrido::getRecorridos();
        return view("recorridos.index");
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $provincias = Provincia::all();
        $provinciaOrigen = Provincia::where('id', 26)->first();
        $ciudadOrigen = Ciudad::where('id', 2602103018)->first();
        return view('recorridos.create')
        ->with("provinciaOrigen", $provinciaOrigen)
        ->with("ciudadOrigen", $ciudadOrigen)
        ->with("provincias", $provincias);
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
        $acumuladorIntervalo = 0;
        for ($i = 0; $i < count($ciudadesParadas); $i++) {
            $valorDecimal = $ciudadesParadas[$i]['hsTramo'];
            $horas = floor($valorDecimal);
            $minutos = ($valorDecimal - $horas) * 60;
            $intervalo = "{$horas} hours {$minutos} minutes";

            $acumuladorIntervalo += $ciudadesParadas[$i]['hsTramo'];
            DB::table('paradas')->insert([
                'id_recorrido' => $idRecorrido,
                'id_ciudad_origen' => $origen,
                'id_ciudad_destino' => $ciudadesParadas[$i]['idDestino'],
                'orden' => $j,
                'hs_tramo' => $intervalo,
            ]);
            $j++;
        }

        // HORAS TOTALES
        $horas = floor($acumuladorIntervalo);
        $minutos = ($acumuladorIntervalo - $horas) * 60;
        $acumuladorIntervalo = "{$horas} hours {$minutos} minutes";

        Recorrido::where('id', $idRecorrido)->update([
            'hs_total' => $acumuladorIntervalo,
        ]);


       return redirect()->route('recorridos.index')->with('success', 'El registro fue guardado correctamente.');
    //    return redirect("recorridos.index")->withSuccess('El registro fue guardado correctamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Recorrido $recorrido)
    {

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

   public function getDatosRecorrido(Request $request){
      $query = Recorrido::query()
        ->join('ciudades as o', 'recorridos.id_ciudad_origen', '=', 'o.id')
            ->join('ciudades as des', 'recorridos.id_ciudad_destino', '=', 'des.id')
            ->join('estados as e', 'recorridos.estado', '=', 'e.id')
            ->select(
                'recorridos.id',
                'o.nombre as ciudad_origen',
                'des.nombre as ciudad_destino',
                'e.estado',
                'recorridos.hs_total',
                DB::raw("TO_CHAR(recorridos.hs_total, 'HH24:MI') AS hs_formateado")
            );

        $total = $query->count();

        // Búsqueda global, o sea por todas las columas
        if ($search = $request->input('search.value')) {
            $query->where(function ($q) use ($search) {
                $q->where('recorridos.id', 'like', "%{$search}%")
                    ->orWhere('o.nombre', 'like', "%{$search}%")
                    ->orWhere('des.nombre', 'like', "%{$search}%");
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

    public function datosDestino(Request $request)
    {
        $destinos = Recorrido::getRecorridosActivosDestinos($request->idOrigen);
        return response()->json($destinos);
    }
}
