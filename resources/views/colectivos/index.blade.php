@extends('layouts.app')

@section('content')


<section>

    <a href="{{ route('colectivos.create') }}" class="btn btn-primary">Crear Colectivo</a>
     <table id="tablacolectivos" class="display">
            <thead>

                <th>ID</th>
                <th>Numero</th>
                <th>Butacas</th>
                <th>Servicios</th>
                <th>Estado</th>
            <tbody>
                </thead>

            </tbody>
        </table>

</section>
@endsection
