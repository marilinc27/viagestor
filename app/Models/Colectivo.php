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

    public static function datosColectivosDisponibles($cantPasajes, $id)
    {
        $query = self::select(
            'colectivos.id',
            'colectivos.nro_colectivo',
            'colectivos.cant_butacas',
            'e.estado'
        )
            ->join('estados as e', 'e.id', 'colectivos.estado')
            ->where('colectivos.estado', 4)
            ->where('colectivos.cant_butacas', '>=', (int) $cantPasajes);

        if (!is_null($id)) {
            $query->where('colectivos.id', '!=', $id);
        }

        return $query->get();
    }

    public static function updateEstado($id, $estado) {
        return self::where('id', $id)
        ->update([
                'estado' => $estado,
            ]);
    }

}
