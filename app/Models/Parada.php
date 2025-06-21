<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class Parada extends Model
{
    protected $table = "paradas";
    protected $primaryKey = "id";
    public $timestamps = false;
    protected $fillable = [
        "id_recorrido",
        "id_ciudad_origen",
        "orden",
        "hs_tramo"
    ];
    public static function getParadasDeUnRecorrido($id)
    {
        return self::join('ciudades as o', 'paradas.id_ciudad_origen', '=', 'o.id')
            ->join('ciudades as des', 'paradas.id_ciudad_destino', '=', 'des.id')
            ->select(
                'paradas.id',
                'o.nombre as ciudad_origen',
                'des.nombre as ciudad_destino',
                'paradas.orden'
            )
            ->where('id_recorrido', $id)
            ->get();
    }

    public static function getParadasPrecios($id_recorrido, $id_viaje)
    {
        return DB::select("
        SELECT
            v.id as id_viaje,
            paradas.id, o.nombre AS ciudad_origen,
            des.nombre AS ciudad_destino,
            paradas.orden,
            precios.precio
        FROM paradas
        JOIN ciudades AS o ON paradas.id_ciudad_origen = o.id
        JOIN ciudades AS des ON paradas.id_ciudad_destino = des.id
        JOIN viajes v ON v.id_recorrido = paradas.id_recorrido
        JOIN precios_paradas precios ON precios.id_viaje = v.id AND precios.id_parada = paradas.id
        WHERE v.id = (
        SELECT DISTINCT(id) FROM viajes WHERE id_recorrido = ? and id= ?)", [$id_recorrido, $id_viaje]);
    }
}
