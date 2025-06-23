@push('styles')
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2024.1.319/styles/kendo.default-v2.min.css" />
    <link rel="stylesheet" href="css/tablas.css" />

@endpush

@extends('layouts.app')

@section('content')
    <div class="w-100">
        <table id="tablePasajes" class="display table-custom">
            <thead>
                <tr class="header-principal">
                    <th colspan="2">Recorrido</th>
                    <th colspan="2">Colectivo</th>
                    <th colspan="2">Salida</th>
                    <th rowspan="2">Pasajes disponibles</th>
                    <th rowspan="2">Estado</th>
                </tr>
                <tr class="sub-header">
                    <th>ORIGEN</th>
                    <th>DESTINO</th>
                    <th>Nro</th>
                    <th>Servicios</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
@endsection

@push('scripts')
    <script src="https://kendo.cdn.telerik.com/2024.1.319/js/kendo.all.min.js"></script>
    <script>
        var urlDatosViajePasaje = "{{ route('datosviajepasaje') }}";
        var urlParadasPrecios = "{{ route('getpreciosparadas') }}";
        var basePasajeUrl = "{{ url('pasajesDatos') }}";
    </script>
    <script src="{{ asset('js/tablas/listarViajesPasajes.js') }}"></script>
    <script src="{{ asset('js/vistas/pasajes/indexPasajes.js') }}"></script>
    <script type="text/x-kendo-template" id="listViewTemplate">
                <div class="d-flex detalleFilaborder w-100">
                    <div class="w-25 p-0">Parada #: orden #</div>
                    <div class="w-25">#: ciudad_destino # </div>
                    <div class="w-25">Precio: #: precio # </div>
                    <div class="w-25">
                        <button class='btn txt-verde-oscuro' id="btnComprarPasaje"
                        data-id=#: id #
                        data-destino="#: ciudad_destino #"
                        data-salida= "#: kendo.toString(fecha_salida, "yyyy-MM-dd HH:mm:ss") #"
                        data-precio=#: precio #
                        data-disponibilidad=#: disponibilidad_total #
                        data-disp-pasajes=#: pasajes_disponibles #
                        data-recorrido=#: id_recorrido #
                        data-viaje=#: id_viaje #>
                            <i class="bi bi-box-arrow-right"></i>
                        </button>
                    </div>
                </div>


                        </script>
@endpush
