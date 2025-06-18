@extends('layouts.app')

@section('content')


<section>

    <a href="{{ route('colectivos.create') }}" class="btn btn-primary mb-5">Crear Colectivo</a>
     <table id="tablacolectivos" class="display table table-bordered">
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
@push('scripts')
    <script>
        var urlDatosColectivo = "{{ route('datosColectivo') }}";
        const baseUrlEdit = "{{ url('colectivos') }}";
    </script>
    <script src="{{ asset('js/tablas/colectivos.js') }}"></script>
@endpush
