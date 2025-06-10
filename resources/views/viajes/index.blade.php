@extends('layouts.app')

@section('content')
    <section>
        <div class="w-100">
            <form id="filtroFechas" class="row g-3">
                <div class="col-md-4">
                    <label for="fechaDesde" class="form-label">Fecha desde</label>
                    <input type="date" class="form-control" id="fechaDesde" name="fechaDesde">
                </div>
                <div class="col-md-4">
                    <label for="fechaHasta" class="form-label">Fecha hasta</label>
                    <input type="date" class="form-control" id="fechaHasta" name="fechaHasta">
                </div>
            </form>
        </div>

        <div class="w-100">
            <table id="tablaviajes" class="display table table-bordered">
                <thead>
                    <tr class="bg-warning">
                        <th colspan="1">ID</th>
                        <th colspan="2">Recorrido</th>
                        <th rowspan="2">Colectivo</th>
                        <th rowspan="2">Fecha de salida</th>
                        <th rowspan="2">Hora de salida</th>
                        <th rowspan="2">Estado</th>
                        <th rowspan="2">Acciones</th>
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
        var fechaDesde;
        var fechaHasta;
    </script>
    <script src="{{ asset('js/tablas/listarViajes.js') }}"></script>
    <script src="{{ asset('js/moment.js') }}"></script>
@endpush
