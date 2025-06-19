@extends('layouts.app')

@section('content')
<h2>Reporte: Destinos más concurridos</h2>
<table class="table table-striped">
    <thead>
        <tr>
            <th>Ciudad destino</th>
            <th>Cantidad de pasajes</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($resultados as $fila)
            <tr>
                <td>{{ $fila->ciudad_destino }}</td>
                <td>{{ $fila->cantidad }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
@endsection