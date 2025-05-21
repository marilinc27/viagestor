@extends('layouts.app')

@section('content')


    <section>

        <div><a href="{{ route('recorridos.create') }}" class="btn btn-primary">Crear recorrido</a></div>
        <div>
            <table id="tablaviajes" class="display">
                <thead>
                    <th>ID</th>
                    <th>Origen</th>
                    <th>Destino</th>
                    <th>Acciones</th>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </section>
@endsection

@push('scripts')
@endpush
