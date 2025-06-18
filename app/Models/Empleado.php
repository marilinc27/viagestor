<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    //
    protected $table = "usuarios";
    protected $primaryKey = "id";
    protected $fillable = [
        "nombre",
        "apellido",
        "email",
        "tipo_usuario"
    ];

    
}
