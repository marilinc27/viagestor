@push('styles')
    <!-- Kendo UI CSS -->
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2024.1.319/styles/kendo.default-v2.min.css" />
    <!-- En el <head> de tu HTML -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
        crossorigin="anonymous" referrerpolicy="no-referrer" />


    <link rel="stylesheet" href="css/tablas.css" />
@endpush

@extends('layouts.app')

@section('content')
    <section>
        <div class="w-100 card mb-3 shadow-sm p-4">
            <span>Fechas de salida</span>
            <form id="filtroFechas" class="row g-3">
                <div class="col-md-4">
                    <label for="fechaDesde" class="form-label">Desde</label>
                    <input type="date" class="form-control" id="fechaDesde" name="fechaDesde">
                </div>
                <div class="col-md-4">
                    <label for="fechaHasta" class="form-label">Hasta</label>
                    <input type="date" class="form-control" id="fechaHasta" name="fechaHasta">
                </div>
            </form>
        </div>

        <div class="w-100">
            <table id="tablaviajes" class="display table-custom">
                <thead>
                    <tr class="header-principal">
                        <th colspan="1">ID</th>
                        <th colspan="2">Recorrido</th>
                        <th rowspan="2">Colectivo</th>
                        <th rowspan="2">Pasajes disponibles</th>
                        <th colspan="2">Salida</th>
                        <th colspan="2">Llegada</th>
                        <th rowspan="2">Estado</th>
                        <th rowspan="2">Acciones</th>
                    </tr>
                    <tr class="sub-header">
                        <th></th>
                        <th>Origen</th>
                        <th>Destino</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- tus filas -->
                </tbody>
            </table>

        </div>

        <!-- POP UP -->
        <div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="miModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar viaje</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <!-- altura fija usando vh y distribución en flex -->
                    <div class="modal-body d-flex" style="height: 70vh;" id="contenedor-detalle">
                        <!-- Columna izquierda con formulario -->
                        <div class="w-50 p-3">
                            <form id="formEditarViaje" method="POST">
                                @csrf
                                @method('PUT')
                                <div class="mb-3">
                                    <input type="hidden" class="form-control" name="idRecorrido" id="idRecorrido">
                                </div>
                                <div class="mb-3">
                                    <input type="hidden" class="form-control" name="idViaje" id="idViaje">
                                </div>
                                <div class="mb-3">
                                    <label for="fechaSalida" class="form-label">Fecha y hora de salida</label>
                                    <div class="input-group" id="datetimepicker1" data-td-target-input="nearest"
                                        data-td-target-toggle="nearest">
                                        <input type="text" class="form-control" name="fechaSalida" id="fechaSalida">
                                        <span class="input-group-text" data-td-toggle="datetimepicker"
                                            data-td-target="#datetimepicker1">
                                            <i class="bi bi-calendar-event"></i>
                                            <!-- Opcional, solo si usás Bootstrap Icons -->
                                        </span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Estado</label>
                                    <select class="form-select" id="estadoActual" name="estadoActual">
                                        @foreach ($estados as $unEstado)
                                            <option value="{{ $unEstado->id }}">{{ $unEstado->estado }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div>
                                    <label for="" class="form-label">Pasajes disponibles</label>
                                    <select class="form-select" id="pasajesDisponiblesActual"
                                        name="pasajesDisponiblesActual">
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <input type="hidden" class="form-control" name="idColectivo" id="idColectivo">
                                </div>
                                <div class="mb-3">
                                    <input type="hidden" class="form-control" name="fechaSalidaOriginal"
                                        id="fechaSalidaOriginal">
                                </div>
                                <div class="mb-3">
                                    <input type="hidden" class="form-control" name="colectivoOriginal"
                                        id="colectivoOriginal">
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Colectivo</label>
                                    <div id="colectivoNoAsignado" class="border d-none" style="height: 80px;">
                                        <p class="text-center text-secondary">Sin asignar</p>
                                    </div>
                                    <div id="colectivoAsignado" class="border p-3 d-none" style="height: 80px;">

                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="w-50 overflow-auto p-3" id="contenedorListView">
                            <div id="buscador-colectivos" style="margin-bottom: 1em;">
                                <!-- <label for="inputBusqueda">Buscar por N° de colectivo:</label> -->
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                                    </div>
                                    <input type="text" id="busquedaColectivo" placeholder="Ej: 1234" class="form-control"
                                        aria-describedby="basic-addon1" />
                                </div>
                            </div>


                            <div id="listView">
                                <h6>COLECTIVOS DISPONIBLES</h6>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-verde-confirmar" id="btnConfirmar">Confirmar</button>
                    </div>
                </div>
            </div>
        </div>

    </section>

@endsection

@push('scripts')
    <!-- Kendo UI JS -->
    <script src="https://kendo.cdn.telerik.com/2024.1.319/js/kendo.all.min.js"></script>

    <script>
        var idViaje;
        var urlDatosViaje = "{{ route('datosviaje') }}";
        var urlDatosColectivosDisponibles = "{{ route('datoscolectivosdisponibles') }}";
        var urlUpdateViaje = "{{ route('viajes.update', ':id') }}";
        var fechaDesde;
        var fechaHasta;
        var cantPasajes;
        var idColectivo;

        window.picker = new tempusDominus.TempusDominus(document.getElementById('datetimepicker1'), {
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
    <script type="text/x-kendo-template" id="listViewTemplate">
                                                <div class="item d-flex border-bottom w-100" id="idItem#: id #">
                                                    <div class="p-1 w-75">
                                                        <div>Nro de Colectivo: #: nro_colectivo # </div>
                                                        <div>Cant asientos: #: cant_butacas #</div>
                                                        <div class="txt-ver-confirmar">#: estado #</div>
                                                    </div>
                                                    <div id="botoneraAsignar" class="w-25">
                                                        <button class="btn btn-sm btnAsignar btn-verde"
                                                        data-id-colectivo="#: id #"
                                                        data-colectivo="#: nro_colectivo #"
                                                        data-butacas-colectivo="#: cant_butacas #"
                                                        >Asignar</button>
                                                    </div>
                                                </div>
                                    </script>

    <script src="{{ asset('js/tablas/listarViajes.js') }}"></script>
    <script src="{{ asset('js/vistas/viajes/indexViaje.js') }}"></script>
    <script src="{{ asset('js/moment.js') }}"></script>
@endpush
