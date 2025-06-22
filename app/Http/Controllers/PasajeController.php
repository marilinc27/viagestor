<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Parada;
use App\Models\Pasaje;
use Carbon\Carbon;

class PasajeController extends Controller
{
    public function index()
    {
        return view("pasajes.index");
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $pasajeros = json_decode($request->pasajeros, true);
        $cantPasajesVendidos = 0;
        foreach ($pasajeros as $unPasajero) {
            $cantPasajesVendidos++;
            //Inserto el pasajero
            $idPasajero = DB::table('pasajeros')->insertGetId([
                'nombre' => $request->nombre,
                'apellido' => $request->apellido,
                'dni' => $request->dni,
            ]);

            DB::table('pasajes')->insert([
                'id_parada_destino' => $request->paradaDestino,
                'fecha_salida' => $request->fechaSalida,
                'id_pasajero' => $idPasajero,
                'precio_final' => $unPasajero['precio'],
                'id_viaje' => $request->viaje,
                'id_descuento' => 0,
                'fecha_llegada' => $request->fechaLlegada,
            ]);
        }

        //actualizo la disponibilidad
        DB::table('viajes')
            ->where('id', $request->viaje)
            ->update([
                'pasajes_disponibles' => $request->disponibilidad
            ]);

        $detalleViaje= Parada::getParadaDestino($request->paradaDestino);
        return view("pasajes.pasarela")
        ->with('precioTotal', $request->total)
        ->with('pasajesVendidos', $cantPasajesVendidos)
        ->with('detalleViaje', $detalleViaje);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {

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

    public function getDatosPasaje(Request $request)
    {
        $ordenParadas = Parada::getParadasDeUnRecorrido($request->recorrido);
        $fechaLlegada = $this->calculoFechaLlegada($request->salida, $ordenParadas, $request->id);
        $butacas = $this->getButacasNoReservadas($request->viaje, $request->disponibilidad);

        return view("pasajes.create")
            ->with("llegada", $fechaLlegada)
            ->with("butacas", $butacas);
    }

    public function calculoFechaLlegada($fechaSalida, $orden, $idParadaTope)
    {
        $paradaTope = Parada::getOrdenParada($idParadaTope);
        $fechaLlegada = Carbon::createFromFormat('Y-m-d H:i:s', $fechaSalida);
        foreach ($orden as $unOrdenParada) {
            if ($unOrdenParada->orden > $paradaTope->orden) {
                return $fechaLlegada;
            } else {
                list($horas, $minutos, $segundos) = explode(':', $unOrdenParada->hs_tramo);
                $horas = (int) $horas;
                $minutos = (int) $minutos;
                $segundos = (int) $segundos;
                $fechaLlegada->addHours($horas)->addMinutes($minutos)->addSeconds($segundos);
            }
        }
        return $fechaLlegada;
    }

    public function getButacasNoReservadas($idViaje, $disponibilidad)
    {
        $butacasReservadas = Pasaje::getButacasReservadas($idViaje)->pluck('nro_butaca')->toArray();

        // Creamos un array con todos los números desde 1 hasta el tope
        $butacas = range(1, $disponibilidad);

        // Obtenemos los que no están en el original
        $butacasFaltantes = array_diff($butacas, $butacasReservadas);

        return $butacasFaltantes;

    }
}
