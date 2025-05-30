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

    public static function getRecorridosActivosOrigen()
    {
        return self::where('estado', 2)
            ->join('ciudades as o', 'recorridos.id_ciudad_origen', '=', 'o.id')
            ->join('provincias as po', 'po.id', '=', 'o.id_provincia')
            ->select(
                'recorridos.id',
                'o.id as id_origen',
                'o.nombre as ciudad_origen',
                'po.nombre as provincia_origen',
            )
            ->get();
    }

    public static function getRecorridosActivosDestinos($id_ciudad)
    {
        return self::where('estado', 2)
            ->where('recorridos.id_ciudad_origen',$id_ciudad)
            ->join('ciudades as des', 'recorridos.id_ciudad_destino', '=', 'des.id')
            ->join('provincias as pdes', 'pdes.id', '=', 'des.id_provincia')
            ->select(
                'recorridos.id',
                'des.nombre as ciudad_destino',
                'pdes.nombre as provincia_destino',
                'recorridos.hs_total'
            )
            ->get();
    }

    public static function getHsTotalRecorridos($id_recorrido)
    {
        return self::where('id', $id_recorrido)
            ->select(
                'recorridos.hs_total'
            )
            ->first();
    }

}
