@extends('layouts.app')

@section('content')
    <section>

        <div><a href="{{ route('viajes.create') }}" class="btn btn-primary">Crear viaje</a></div>
        <div>
            <table id="tablaviajes" class="display table table-bordered">
                <thead>
                    <tr class="bg-warning">
                        <th colspan="1">ID</th>
                        <th colspan="2">Recorrido</th>
                        <th rowspan="2">Colectivo</th>
                        <th rowspan="2">Fecha y hora de salida</th>
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
    </section>
@endsection

@push('scripts')
    <script>
        var urlDatosViaje = "{{ route('datosviaje') }}";
    </script>
    <script src="{{ asset('js/tablas/listarViajes.js') }}"></script>
@endpush
