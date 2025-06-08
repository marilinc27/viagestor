<?php

namespace App\Http\Controllers;

use App\Models\Provincia;
use App\Models\Recorrido;
use App\Models\Viaje;
use App\Models\Colectivo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

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
        $recorridos = Recorrido::getRecorridosActivosOrigen();

        return view('viajes.create')
            ->with("recorridos", $recorridos);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $paradasPrecios= json_decode($request->precios, true);
        foreach ($paradasPrecios as $precio) {
            DB::table('precios_paradas')->insert([
                'id_parada' => $precio['idParada'],
                'fecha_salida' => $request->fechaSalida,
                'precio' => $precio['precio']
            ]);
        }

        // CALCULO FECHA DE LLEGADA
        $hs_total = Recorrido::getHsTotalRecorridos($request->idRecorrido);

        $fechaLlegada = Carbon::createFromFormat('Y-m-d\TH:i', $request->fechaSalida);

        list($horas, $minutos, $segundos) = explode(':', $hs_total['hs_total']);

        $horas = (int) $horas;
        $minutos = (int) $minutos;
        $segundos = (int) $segundos;

        $fechaLlegada->addHours($horas)->addMinutes($minutos)->addSeconds($segundos);

        DB::table('viajes')->insert([
                'id_recorrido' => $request->idRecorrido,
                'fecha_salida' => $request->fechaSalida,
                'fecha_llegada' => $fechaLlegada,
                'estado' => 2
            ]);
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
        $search = $request->input('search.value');

        $query->join('recorridos', 'recorridos.id', 'viajes.id_recorrido')
            ->join('ciudades as des', 'des.id', 'recorridos.id_ciudad_destino')
            ->join('ciudades as ori', 'ori.id', 'recorridos.id_ciudad_origen')
            ->leftJoin('colectivos', 'colectivos.id', 'viajes.id_colectivo')
            ->select('viajes.id',
                        'viajes.fecha_salida',
                        'viajes.estado',
                        'des.nombre as ciudad_destino',
                        'ori.nombre as ciudad_origen',
                        'colectivos.nro_colectivo');

        if ($search = $request->input('search.value')) {
            $query->where(function ($q) use ($search) {
                $q->where('viajes.id', 'like', "%{$search}%")
                    ->orWhere('viajes.id_recorrido', 'like', "%{$search}%")
                    ->orWhere('viajes.id_colectivo', 'like', "%{$search}%");
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
