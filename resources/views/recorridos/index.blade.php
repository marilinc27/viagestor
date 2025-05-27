@extends('layouts.app')

@section('content')

    <section>
        <div><a href="{{ route('recorridos.create') }}" class="btn btn-primary">Crear recorrido</a></div>
        <div>
            <table id="tableRecorridos" class="display">
                <thead>
                    <th>ID</th>
                    <th>Origen</th>
                    <th>Destino</th>
                    <th>Horas totales</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <!-- POP UP -->
        <div class="modal fade" id="modalDetalles" tabindex="-1" aria-labelledby="miModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Detalle del recorrido</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body" id="contenedor-detalle">
                        <table id="tableDetalleRecorrido" class="w-75">
                            <thead>
                                <thead>
                                    <tr>
                                        <th>ORDEN</th>
                                        <th>ORIGEN</th>
                                        <th>DESTINO</th>
                                    </tr>
                                <tbody>
                                </tbody>
                            </thead>
                            </thead>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

    </section>
@endsection

@push('scripts')

    <script>

        var idRecorrido;
        const baseUrl = @json(route('paradas.show', ['parada' => '__ID__']));
        var urlDatosParadas;
        var urlDatosRecorridos = "{{ route('datosrecorridos') }}";
    </script>
    <script src="{{ asset('js/tablas/listarRecorridos.js') }}"></script>
    <script src="{{ asset('js/vistas/recorridos/indexRecorrido.js') }}"></script>
    <script src="{{ asset('js/tablas/listarDetalleRecorrido.js') }}"></script>
@endpush
