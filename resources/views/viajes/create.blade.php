@extends('layouts.app')
@push('styles')
    <!-- PROPIOS -->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">
@endpush
@section('content')
    <div class="w-100 d-flex">
        <div class="w-40 p-3">
            <form action="{{ route('viajes.store') }}" method="POST" id="formViajes">
                @csrf
                <div class="mb-3">
                    <label for="">ORIGEN</label>
                    <select id="select-origen" class="w-100">
                        <option value="0">Seleccione una ciudad</option>
                        @foreach ($recorridos as $unRecorrido)
                            <option value="{{ $unRecorrido->id }}" data-idorigen="{{ $unRecorrido->id_origen }}">
                                {{ $unRecorrido->ciudad_origen . "-" . $unRecorrido->provincia_origen }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="mb-3">
                    <label for="">DESTINO</label>
                    <select id="select-destino" class="w-100">
                        <option value="">Seleccione un destino</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="">Fecha de salida</label>
                    <input type="datetime-local" class="form-control w-100" name="fechaSalida" id="fechaSalida">
                </div>
                <input type="hidden" class="form-control" name="idRecorrido" id="idRecorrido">

                <input type="hidden" class="form-control" name="precios" id="preciosFinal">
                <div>
                    <button type="submit" id="btnGuardar" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
        <div class="w-60">
            <table id="tableDetalleRecorrido" class="table">
                <thead>
                    <thead>
                        <tr>
                            <th colspan="4">PARADAS</th>
                        </tr>
                        <tr>
                            <th class="w-20">ORDEN</th>
                            <th class="w-25">ORIGEN</th>
                            <th class="w-25">DESTINO</th>
                            <th class="w-30">PRECIO</th>
                        </tr>
                    <tbody>

                    </tbody>
                </thead>
                </thead>
            </table>
        </div>
    </div>

@endsection
@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js"></script>
    <script>
        const baseUrl = @json(route('paradas.show', ['parada' => '__ID__']));
        var urlDatosOrigen = "{{ route('datosdestino') }}";
        var urlDatosCiudades = "{{ route('datosciudades') }}";
        var urlDatosParadas;
        var idRecorrido;
    </script>
    <!-- <script src="{{ asset('js/selects/colectivos.js') }}"></script> -->
    <script src="{{ asset('js/selects/destinos.js') }}"></script>
    <script src="{{ asset('js/vistas/viajes/createViaje.js') }}"></script>
    <script src="{{ asset('js/tablas/listarDetalleRecorrido.js') }}"></script>
@endpush
