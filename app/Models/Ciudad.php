<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ciudad extends Model
{
    protected $table = "ciudades";
    protected $primaryKey = "id";

    static function getCiudades($idProvincia)
    {
        $ciudades = Ciudad::where('id_provincia', $idProvincia)->get();
        return $ciudades;
    }
}
