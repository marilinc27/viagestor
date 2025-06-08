<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PrecioParada extends Model
{
protected $primaryKey1 = "id_parada";
protected $primaryKey2 = "fecha_salida";
    protected $fillable = [
        "precio"
    ];
}
