@extends('layouts.app')

<link rel="stylesheet" href="css/tablas.css" />


@section('content')
    <section>
        <!-- <div><a href="{{ route('recorridos.create') }}" class="btn btn-primary">
        <i class="bi bi-map"></i>
        Crear recorrido
        </a></div> -->
        <div>
            <table id="tableRecorridos" class="table-custom">
                <thead>
                    <tr class="header-principal">
                        <th>Origen</th>
                        <th>Destino</th>
                        <th>Horas totales</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
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
                        <table id="tableDetalleRecorrido" class="w-75 table-custom">
                            <thead>
                                <tr class="header-principal">
                                    <th>ORDEN</th>
                                    <th>ORIGEN</th>
                                    <th>DESTINO</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
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
        var urlCrearRecorrido = "{{ route('recorridos.create') }}";
    </script>
    <script src="{{ asset('js/tablas/listarRecorridos.js') }}"></script>
    <script src="{{ asset('js/vistas/recorridos/indexRecorrido.js') }}"></script>
    <script src="{{ asset('js/tablas/listarDetalleRecorrido.js') }}"></script>
@endpush
