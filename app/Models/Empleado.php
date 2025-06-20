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
        "tipo_usuario",
        "estado"
    ];

    public function user()
    {
        return $this->hasOne(User::class, 'email', 'email');
    }

    public static function get()
    {
        $query = self::select(
            'usuarios.id',
            'usuarios.nombre',
            'usuarios.apellido',
            'usuarios.email',
            'tu.tipo'
        )
            ->join('tipos_usuarios as tu', 'tu.id', 'usuarios.tipo_usuario')
            ->where('usuarios.estado', '=', '2');
        return $query->get();
    }
}
