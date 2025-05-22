<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
}
