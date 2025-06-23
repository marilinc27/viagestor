@extends('layouts.app')
<link rel="stylesheet" href="css/tablas.css" />
@section('content')
    <section>

        <!-- <a href="{{ route('colectivos.create') }}" class="btn btn-primary mb-5">Crear Colectivo</a> -->
        <table id="tablacolectivos" class="display table-custom">
            <thead>
                <tr class="header-principal">
                    <th>ID</th>
                    <th>Numero</th>
                    <th>Butacas</th>
                    <th>Servicios</th>
                    <th>Estado</th>
                </tr>
            </thead>

            <tbody>

            </tbody>
        </table>

    </section>
@endsection
@push('scripts')
    <script>
        var urlDatosColectivo = "{{ route('datosColectivo') }}";
        const baseUrlEdit = "{{ url('colectivos') }}";
        var urlCrearColectivo = "{{ route('colectivos.create') }}";
    </script>
    <script src="{{ asset('js/tablas/colectivos.js') }}"></script>
@endpush
