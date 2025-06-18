@extends('layouts.app')

@section('content')


<section>

    <a href="{{ route('empleados.create') }}" class="btn btn-primary mb-5">Crear Empleado</a>
     <table id="tablacolectivos" class="display table table-bordered">
            <thead>

                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Email</th>
                <th>Estado</th>
            <tbody>
                </thead>

            </tbody>
        </table>

</section>
@endsection