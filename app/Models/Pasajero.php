<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pasajero extends Model
{
    //
    protected $table = "pasajeros";
    protected $primaryKey = "id";
    protected $fillable = [
        "nombre",
        "apellido",
        "dni"
    ];

}
