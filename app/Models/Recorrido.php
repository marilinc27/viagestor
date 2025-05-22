<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Recorrido extends Model
{
    protected $table = "recorridos";
    protected $primaryKey = "id";
    public $timestamps = false;
    protected $fillable = [
        "id_ciudad_origen",
        "id_ciudad_destino",
        "estado",
        "hs_total"
    ];
    // protected $recorridos = Recorrido::all();

    public static function getRecorridos()
    {
        return self::join('ciudades as o', 'recorridos.id_ciudad_origen', '=', 'o.id')
            ->join('ciudades as des', 'recorridos.id_ciudad_destino', '=', 'des.id')
            ->join('estados as e', 'recorridos.estado', '=', 'e.id')
            ->select(
                'recorridos.id',
                'o.nombre as ciudad_origen',
                'des.nombre as ciudad_destino',
                'e.estado',
                'recorridos.hs_total'
            )
            ->get();
    }

    static function datosViaje($data)
    {

    }



}
