@extends('layouts.app')
@push('styles')
    <!-- PROPIOS -->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">
@endpush
@section('content')
    <section class="d-flex w-100">
        <div class="w-50">
            <form id="form" class="col-12 w-75" action="{{ route('viajes.store') }}" type="POST">
                @csrf
                <div class="d-flex">
                    <div>
                        <select id="select-origen">
                            <option value="0">Seleccione una ciudad</option>
                            @foreach ($recorridos as $unRecorrido)
                                <option value="{{ $unRecorrido->id }}" data-idorigen="{{ $unRecorrido->id_origen }}">
                                    {{ $unRecorrido->ciudad_origen . "-" . $unRecorrido->provincia_origen }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div>
                        <select id="select-destino">
                            <option value="">Seleccione un destino</option>
                        </select>
                    </div>

                </div>
                <div class="form-group">
                    <label for="">Fecha de salida</label>
                    <input type="date" class="form-control" id="fechaSalida" name="fechaSalida">
                </div>
                <div class="form-group">
                    <select id="select-colectivo" disabled>
                        <option value="">Seleccione un colectivo</option>
                    </select>
                    <small id="colectivoHelp" class="">Seleccione un rercorrido y fecha para consultar disponibilidad.</small>
                </div>
                <div class="form-group">
                    <label for="">Hora de salida</label>
                    <input type="time" class="form-control" id="" disabled>
                </div>
            </form>
        </div>
        <div class="w-50">
            <table id="tableDetalleRecorrido">
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
    </section>
@endsection
@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js"></script>
    <script>
        const baseUrl = @json(route('paradas.show', ['parada' => '__ID__']));
        var urlDatosOrigen = "{{ route('datosdestino') }}";
        var urlDatosCiudades = "{{ route('datosciudades') }}";
        var urlDatosColectivos = "{{ route('datoscolectivosdisponibles') }}";
        var urlDatosParadas;
        var idRecorrido;
    </script>
    <script src="{{ asset('js/selects/colectivos.js') }}"></script>
    <script src="{{ asset('js/selects/destinos.js') }}"></script>
    <script src="{{ asset('js/vistas/viajes/createViaje.js') }}"></script>
    <script src="{{ asset('js/tablas/listarDetalleRecorrido.js') }}"></script>
@endpush
