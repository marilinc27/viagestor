<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Viaje extends Model
{
    protected $table = "viajes";
    protected $primaryKey = "id";
    protected $fillable = [
        "id_recorrido",
        "id_colectivo",
        "fecha_salida",
        "hora_salida",
        "estado"
    ];
     public $timestamps = false;


    static function getViajes()
    {
        $viajes = Viaje::select()
            ->join('recorridos', 'recorridos.id', 'viajes.id_recorrido')
            ->join('colectivos', 'colectivos.id', 'viajes.id_colectivo')
            ->get();

        return $viajes;
    }

    static function getViaje($id)
    {
        $viaje = Viaje::select()
            ->join('recorridos', 'recorridos.id', 'viajes.id_recorrido')
            ->join('colectivos', 'colectivos.id', 'viajes.id_colectivo')
            ->where('id', $id)
            ->first();

        return $viaje;
    }
}
