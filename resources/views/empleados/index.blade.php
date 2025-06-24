@extends('layouts.app')
<link rel="stylesheet" href="css/tablas.css" />
@section('content')
    <section>

        <a href="{{ route('empleados.create') }}" class="btn btn-primary mb-5">Crear Empleado</a>
        <table id="tablaempleados" class="display table display table-custom">
            <thead>
                <tr class="header-principal">
                    <th>ID</th>
                    <th>Nombre y apellido</th>
                    <th>Correo</th>
                    <th>Tipo</th>
                    <th>Acciones</th>
                </tr>

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
