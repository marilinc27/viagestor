<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pasaje extends Model
{
    //
    protected $table = "pasajes";
    protected $primaryKey = "id";
    protected $fillable = [
        "id_parada_destino",
        "fecha_salida",
        "estado",
        "id_pasajero",
        "precio_final",
        "nro_butaca",
        "id_viaje",
        "id_descuento",
        "fecha_llegada"
    ];

    public static function getButacasReservadas($idViaje)
    {
        return self::where('id_viaje', $idViaje)
            ->select("pasajes.nro_butaca")
            ->get();

    }

}
