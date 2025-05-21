<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Recorrido extends Model
{
    protected $table = "recorridos";
    protected $primaryKey = "id";
    protected $fillable = [
        "id_ciudad_origen",
        "id_ciudad_destino",
        "estado",
        "hs_total"
    ];
    // protected $recorridos = Recorrido::all();

}
