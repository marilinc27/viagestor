<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Colectivo extends Model
{
    protected $table = "colectivos";
    protected $primaryKey = "id";
    protected $fillable = ['nro_colectivo', 'cant_butacas', 'estado', 'servicios'];


    static function getColectivos()
    {
        $colectivos = Colectivo::select()
            ->get();
        var_dump($colectivos);

        return $colectivos;
    }
    static function getColectivo($id)
    {
        $colectivo = Colectivo::select()
            ->where('id', $id)
            ->first();

        return $colectivo;
    }

    public static function getColectivosHabilitados()
    {

        $colectivos = self::select('*')
        ->where('estado',4)
        ->get();
        return $colectivos;
    }

}
