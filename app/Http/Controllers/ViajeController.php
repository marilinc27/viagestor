<?php

namespace App\Http\Controllers;

use App\Models\Colectivo;
use App\Models\Recorrido;
use App\Models\Viaje;
use App\Models\Estado;
use App\Models\Ciudad;
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
        $estados = Estado::getEstadosViaje();
        return view("viajes.index", compact("estados"));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $recorridos = Recorrido::getRecorridosActivosOrigen();
        $ciudadOrigen = Ciudad::where('id', 2602103018)->first();
        return view('viajes.create')
            ->with("recorridos", $ciudadOrigen);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $fechaSalidaFormateada = $this->formateoFecha($request->fechaSalida);

        // CALCULO FECHA DE LLEGADA
        $hs_total = Recorrido::getHsTotalRecorridos($request->idRecorrido);

        $fechaLlegada = Carbon::createFromFormat('Y-m-d\TH:i', $fechaSalidaFormateada);

        list($horas, $minutos, $segundos) = explode(':', $hs_total['hs_total']);

        $horas = (int) $horas;
        $minutos = (int) $minutos;
        $segundos = (int) $segundos;

        $fechaLlegada->addHours($horas)->addMinutes($minutos)->addSeconds($segundos);

        $idViaje = DB::table('viajes')->insertGetId([
            'id_recorrido' => $request->idRecorrido,
            'fecha_salida' => $fechaSalidaFormateada,
            'fecha_llegada' => $fechaLlegada,
            'pasajes_disponibles' => $request->pasajesDisponibles,
            'disponibilidad_total' => $request->pasajesDisponibles,
            'estado' => 2
        ]);

        $paradasPrecios = json_decode($request->precios, true);
        foreach ($paradasPrecios as $precio) {
            DB::table('precios_paradas')->insert([
                'id_parada' => $precio['idParada'],
                'id_viaje' => $idViaje,
                'precio' => $precio['precio']
            ]);
        }

        return redirect()->route('viajes.index')->with('success', 'El registro fue guardado correctamente.');
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
        $fechaSalidaFormateada = $this->formateoFecha($request->fechaSalida);
        $fechaLlegada = $this->calculoFechaLlegada($request->idRecorrido, $fechaSalidaFormateada);

        DB::table('viajes')
            ->where('id', $request->idViaje)
            ->update([
                'id_colectivo' => $request->idColectivo,
                'fecha_salida' => $fechaSalidaFormateada,
                'fecha_llegada' => $fechaLlegada,
                'estado' => $request->estadoActual,
                'disponibilidad_total' => $request->pasajesDisponiblesActual
            ]);


        if (isset($request->colectivoOriginal)) {
            //Si ya habia un colectivo asignado lo vuelvo a poner como disponible y luego resuervo el nuevo
            Colectivo::updateEstado($request->colectivoOriginal, 4);
            Colectivo::updateEstado($request->idColectivo, 6);
        } else {
            if (isset($request->idColectivo)) {
                Colectivo::updateEstado($request->idColectivo, 6);
            }
        }

        return redirect()->route('viajes.index')->with('success', 'El registro fue modificado correctamente.');
    }


    public function destroy(Viaje $viaje)
    {
        //
    }

    public function datosViaje(Request $request)
    {
        $query = Viaje::query();
        $queryCompleto = Viaje::query();

        $total = $query->count();

        $desde = $request->input('fechaDesde');
        $hasta = $request->input('fechaHasta');

        // Configurar $query
        $query->join('recorridos', 'recorridos.id', 'viajes.id_recorrido')
            ->join('ciudades as des', 'des.id', 'recorridos.id_ciudad_destino')
            ->join('ciudades as ori', 'ori.id', 'recorridos.id_ciudad_origen')
            ->join('estados as e', 'e.id', 'viajes.estado')
            ->leftJoin('colectivos', 'colectivos.id', 'viajes.id_colectivo')
            ->select(
                'viajes.id',
                'viajes.id_recorrido',
                'viajes.fecha_salida as fh_salida',
                'viajes.pasajes_disponibles',
                'viajes.disponibilidad_total',
                'e.id as id_estado',
                'e.estado',
                'des.nombre as ciudad_destino',
                'ori.nombre as ciudad_origen',
                'colectivos.nro_colectivo',
                'colectivos.cant_butacas',
                'colectivos.id as id_colectivo'
            )
            ->selectRaw("DATE(viajes.fecha_salida) as fecha_s")
            ->selectRaw("TO_CHAR(viajes.fecha_salida, 'HH24:MI') as hora_s")
            ->selectRaw("DATE(viajes.fecha_llegada) as fecha_ll")
            ->selectRaw("TO_CHAR(viajes.fecha_llegada, 'HH24:MI') as hora_ll")
            ->whereIn('viajes.estado', [2, 7]);

        // Copiar la misma estructura a $queryCompleto
        $queryCompleto = clone $query;

        if ($desde && $hasta) {
            $query->whereBetween(DB::raw('DATE(viajes.fecha_salida)'), [$desde, $hasta]);
            $queryCompleto->whereBetween(DB::raw('DATE(viajes.fecha_salida)'), [$desde, $hasta]);
        }

        $search = $request->input('search.value');

        if ($search) {
            $queryCompleto->where(function ($q) use ($search) {
                $q->where('des.nombre', 'ilike', "{$search}%")
                    ->orWhere('ori.nombre', 'ilike', "{$search}%");
            });

            $filtered = $queryCompleto->count();
            $finalQuery = $queryCompleto;
        } else {
            $filtered = $query->count();
            $finalQuery = $query;
        }

        // Ordenar
        $orderColIndex = $request->input('order.0.column');
        $orderDir = $request->input('order.0.dir');
        $orderColName = $request->input("columns.$orderColIndex.data");
        if ($orderColName) {
            $finalQuery->orderBy($orderColName, $orderDir);
        }

        // Paginación
        $start = $request->input('start', 0);
        $length = $request->input('length', 10);

        $data = $finalQuery->skip($start)->take($length)->get();

        return response()->json([
            'draw' => intval($request->input('draw')),
            'recordsTotal' => $total,
            'recordsFiltered' => $filtered,
            'data' => $data,
        ]);
    }

    public function datosViajePasaje(Request $request)
    {
        $query = Viaje::query();

        $fechaInicio = Carbon::now(); // ahora mismo
        $fechaFin = Carbon::now()->addMonths(2); // exactamente dentro de 2 meses a esta hora


        $query->join('recorridos', 'recorridos.id', 'viajes.id_recorrido')
            ->join('ciudades as des', 'des.id', 'recorridos.id_ciudad_destino')
            ->join('ciudades as ori', 'ori.id', 'recorridos.id_ciudad_origen')
            ->join('estados as e', 'e.id', 'viajes.estado')
            ->leftJoin('colectivos', 'colectivos.id', 'viajes.id_colectivo')
            ->select(
                'viajes.id',
                'viajes.id_recorrido',
                'viajes.fecha_salida as fh_salida',
                'viajes.pasajes_disponibles',
                'viajes.disponibilidad_total',
                'e.id as id_estado',
                'e.estado',
                'des.nombre as ciudad_destino',
                'ori.nombre as ciudad_origen',
                'colectivos.servicios',
                'colectivos.nro_colectivo',
                'colectivos.cant_butacas',
                'colectivos.id as id_colectivo'
            )
            ->selectRaw("TO_CHAR(viajes.fecha_salida, 'DD/MM/YYYY') as fecha_s")
            ->selectRaw("TO_CHAR(viajes.fecha_salida, 'HH24:MI') as hora_s")
            ->whereBetween('viajes.fecha_salida', [$fechaInicio, $fechaFin])
            ->whereIn('viajes.estado', [2, 7]);

        $total = $query->count();

        // Búsqueda global, o sea por todas las columas
        if ($search = $request->input('search.value')) {
            $query->where(function ($q) use ($search) {
                $q->where('des.nombre', 'ilike', "{$search}%")
                    ->orWhere('ori.nombre', 'ilike', "{$search}%");
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


    public function calculoFechaLlegada($idRecorrido, $fechaSalida)
    {
        $hs_total = Recorrido::getHsTotalRecorridos($idRecorrido);

        $fechaLlegada = Carbon::createFromFormat('Y-m-d\TH:i', $fechaSalida);

        list($horas, $minutos, $segundos) = explode(':', $hs_total['hs_total']);

        $horas = (int) $horas;
        $minutos = (int) $minutos;
        $segundos = (int) $segundos;

        return $fechaLlegada->addHours($horas)->addMinutes($minutos)->addSeconds($segundos);
    }

    public function formateoFecha($fecha)
    {
        $fechaOriginal = $fecha;
        $fechaLimpia = str_replace(["\u{A0}", "\xc2\xa0", ".", "A M", "P M"], [' ', ' ', '', 'AM', 'PM'], $fechaOriginal);

        $fechaLimpia = preg_replace('/\s+/u', ' ', trim($fechaLimpia));


        $fechaCarbon = Carbon::createFromFormat('m/d/Y h:i A', $fechaLimpia);
        $fechaFinal = $fechaCarbon->format('Y-m-d\TH:i');
        return $fechaFinal;
    }

//     public function formateoFechaUpdate($fecha)
// {
//     // Primero, convertimos la cadena para que los espacios no rompibles (U+00A0) sean espacios normales
//     $fechaLimpia = str_replace("\u{A0}", ' ', $fecha);  // espacio unicode a espacio normal

//     // Ahora removemos puntos y espacios dentro del AM/PM
//     // Ejemplo: "A. M." o "P. M." => "AM" o "PM"
//     $fechaLimpia = preg_replace('/A\.?\s*M\.?/i', 'AM', $fechaLimpia);
//     $fechaLimpia = preg_replace('/P\.?\s*M\.?/i', 'PM', $fechaLimpia);

//     // Quitamos otros posibles puntos sobrantes
//     $fechaLimpia = str_replace('.', '', $fechaLimpia);

//     // Limpiamos espacios múltiples
//     $fechaLimpia = preg_replace('/\s+/', ' ', trim($fechaLimpia));

//     // Intentamos parsear con Carbon
//     try {
//         $fechaCarbon = Carbon::createFromFormat('m/d/Y h:i A', $fechaLimpia);
//         $fechaFinal = $fechaCarbon->format('Y-m-d\TH:i');
//         return $fechaFinal;
//     } catch (\Exception $e) {
//         // En caso de error, devolvemos el mensaje para debug
//         return "Error de fecha: " . $e->getMessage() . " | Fecha limpia: '$fechaLimpia'";
//     }
// }



}
