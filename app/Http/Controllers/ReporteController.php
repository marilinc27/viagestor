<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ReporteController extends Controller
{
    public function destinosMasConcurridos()
    {
        $datos = DB::table('pasajes')
            ->select('destino', DB::raw('COUNT(*) as cantidad'))
            ->groupBy('destino')
            ->orderByDesc('cantidad')
            ->get();

        return view('reportes.destinos', compact('datos'));
    }

    public function destinosMasConcurridosPDF()
    {
        $datos = DB::table('pasajes')
            ->select('destino', DB::raw('COUNT(*) as cantidad'))
            ->groupBy('destino')
            ->orderByDesc('cantidad')
            ->get();

        $pdf = Pdf::loadView('reportes.destinos_pdf', compact('datos'));
        return $pdf->download('destinos_mas_concurridos.pdf');
    }
}
