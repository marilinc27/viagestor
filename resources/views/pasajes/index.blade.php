@extends('layouts.app')

@section('content')
        <div class="w-100">
            <table id="tablePasajes" class="display table table-bordered">
                <thead>
                    <tr class="bg-warning">
                        <th colspan="1">ID</th>
                        <th colspan="2">Recorrido</th>
                        <th rowspan="2">Colectivo</th>
                        <th rowspan="2">Fecha de salida</th>
                        <th rowspan="2">Hora de salida </th>
                        <th rowspan="2">Asientos disponibles</th>
                        <th rowspan="2">Servicios</th>
                        <th rowspan="2">Estado</th>
                    </tr>
                    <tr class="bg-info">
                        <th></th>
                        <th>ORIGEN</th>
                        <th>DESTINO</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
@endsection

@push('scripts')
    <script>
        var urlDatosViaje = "{{ route('datosviaje') }}";
    </script>
    <script src="{{ asset('js/tablas/listarViajesPasajes.js') }}"></script>
@endpush
