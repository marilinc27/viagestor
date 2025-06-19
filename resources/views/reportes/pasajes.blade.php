@extends('layouts.app')

@section('content')
<h2>Reporte: Pasajes vendidos por día</h2>
<table class="table table-striped">
    <thead>
        <tr>
            <th>Fecha de salida</th>
            <th>Cantidad de pasajes</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($resultados as $fila)
            <tr>
                <td>{{ $fila->fecha_salida }}</td>
                <td>{{ $fila->cantidad }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
@endsection