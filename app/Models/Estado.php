<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Estado extends Model
{
    protected $table = "estados";
    protected $primaryKey = "id";
    public $timestamps = false;
    protected $fillable = [
        "estado",
        "tipo"
    ];

    public static function getEstadosColectivo()
    {
        return self::select('*')
            ->where('tipo', 'COLECTIVO')
            ->get();
    }

    public static function getEstadosViaje()
    {
        return self::select('*')
            ->where('tipo', 'VIAJE')
            ->whereNot('id', 7)
            ->get();
    }
}
