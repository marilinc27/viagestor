@extends('layouts.app')

@section('content')
    <section>

        <div><a href="{{ route('viajes.create') }}" class="btn btn-primary">Crear viaje</a></div>
        <div>
            <table id="tablaviajes" class="display">
                <thead>
                    <th>ID</th>
                    <th>Recorrido</th>
                    <th>Colectivo</th>
                    <th>Fecha salida</th>
                    <th>Hora salida</th>
                    <th>Acciones</th>
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
    <script src="{{ asset('js/tablas/viajes.js') }}"></script>
@endpush
