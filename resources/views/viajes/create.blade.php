@extends('layouts.app')
@push('styles')
    <!-- PROPIOS -->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/path/to/select2.css">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/@ttskch/select2-bootstrap4-theme@x.x.x/dist/select2-bootstrap4.min.css">

    <!-- Popperjs -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        crossorigin="anonymous"></script>
    <!-- Tempus Dominus JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/@eonasdan/tempus-dominus@6.9.4/dist/js/tempus-dominus.min.js"
        crossorigin="anonymous"></script>

    <!-- Tempus Dominus Styles -->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/@eonasdan/tempus-dominus@6.9.4/dist/css/tempus-dominus.min.css"
        crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />


    <link rel="stylesheet" href="{{ asset('css/tablas.css') }}">

@endpush
@section('content')
    <div class="w-100 d-flex">
        <div class="w-40 p-3 card mr-1">
            <div class="text-center mb-4"><h2>Registrar viaje</h2></div>
            <form action="{{ route('viajes.store') }}" method="POST" id="formViajes">
                @csrf
                <div class="mb-3">
                    <label for="">ORIGEN</label>
                    <select id="select-origen" class="w-100" disabled>
                        <option value="{{ $recorridos->id }}">{{ $recorridos->nombre }}</option>

                    </select>
                </div>
                <div class="mb-3">
                    <label for="">DESTINO</label>
                    <select id="select-destino" class="w-100">
                        <option value="">Seleccione un destino</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="">Fecha y hora de salida</label>
                    <div class="input-group" id="datetimepicker1" data-td-target-input="nearest"
                        data-td-target-toggle="nearest">
                        <input type="text" class="form-control" name="fechaSalida" id="fechaSalida"
                            data-td-target="#datetimepicker1" />
                        <span class="input-group-text" data-td-toggle="datetimepicker" data-td-target="#datetimepicker1">
                            <i class="bi bi-calendar-event"></i> <!-- Opcional, solo si usás Bootstrap Icons -->
                        </span>
                    </div>
                </div>

                <input type="hidden" class="form-control" name="idRecorrido" id="idRecorrido">

                <input type="hidden" class="form-control" name="precios" id="preciosFinal">
                <div class="mb-3">
                    <label for="">Disponibilidad de pasajes</label>
                    <select name="pasajesDisponibles" id="pasajesDisponibles" class="form-select">
                        <option value="0">Seleccione un rango</option>
                        <option value="30">20 - 30 asientos</option>
                        <option value="40">31 - 40 asientos</option>
                        <option value="50">41 - 50 asientos</option>
                        <option value="60">51 - 60 asientos</option>
                    </select>
                </div>
                <div class="text-end">
                    <button type="submit" id="btnGuardar" class="btn btn-verde-confirmar">Confirmar</button>
                </div>
            </form>
        </div>
        <div class="w-50 ms-3">
            <table id="tableDetalleRecorrido" class="display table-custom">
                <thead>
                    <tr id="header-detalle-recorrido" class="">
                        <th colspan="4">PARADAS</th>
                    </tr>
                    <tr class="sub-header">
                        <th class="w-20">ORDEN</th>
                        <th class="w-25">ORIGEN</th>
                        <th class="w-25">DESTINO</th>
                        <th class="w-30">PRECIO</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
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

        const picker = new tempusDominus.TempusDominus(document.getElementById('datetimepicker1'), {
            display: {
                components: {
                    calendar: true,
                    date: true,
                    month: true,
                    year: true,
                    decades: true,
                    clock: true,
                    hours: true,
                    minutes: true,
                    seconds: false,
                    useTwentyfourHour: false,
                }
            },
            localization: {
                locale: 'es',
            },
            stepping: 15, // Intervalo de 15 minutos
            restrictions: {
                minDate: new Date() // hoy y en adelante
            }
        });
    </script>
    <!-- <script src="{{ asset('js/selects/colectivos.js') }}"></script> -->
    <script src="{{ asset('js/selects/destinos.js') }}"></script>
    <script src="{{ asset('js/vistas/viajes/createViaje.js') }}"></script>
    <script src="{{ asset('js/tablas/listarDetalleRecorrido.js') }}"></script>
@endpush
