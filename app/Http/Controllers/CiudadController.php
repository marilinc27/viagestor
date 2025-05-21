<?php

namespace App\Http\Controllers;

use App\Models\Ciudad;
use Illuminate\Http\Request;

class CiudadController extends Controller
{
    public function datosCiudades(Request $request)
    {
        $ciudades = Ciudad::getCiudades($request->idProvincia);
        return response()->json($ciudades);
    }
}
