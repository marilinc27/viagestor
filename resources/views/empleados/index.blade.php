@extends('layouts.app')

@section('content')
    <section>

        <a href="{{ route('empleados.create') }}" class="btn btn-primary mb-5">Crear Empleado</a>
        <table id="tablaempleados" class="display table table-bordered">
            <thead>

                <th>ID</th>
                <th>Nombre y apellido</th>
                <th>Correo</th>
                <th>Tipo</th>
                <th>Acciones</th>
            </thead>

            <tbody>

            </tbody>
        </table>

    </section>
@endsection

@push('scripts')
    <script>
        var urlDatosEmpleado = "{{ route('datosEmpleado') }}";
        const baseUrlEdit = "{{ url('empleados') }}";
    </script>
    <script src="{{ asset('js/tablas/empleados.js') }}"></script>
@endpush
