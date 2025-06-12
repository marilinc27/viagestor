@extends('layouts.app')

@push('styles')
    <!-- PROPIOS -->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">
@endpush

@section('content')
    <div class="w-100 d-flex">
        <div class="bg-success w-40">
            <form>
                @csrf
                <!-- <div class="col-md-5">
                    <select class="form-cotrol" name="idaVuelta" id="idaVuelta" disabled>
                        <option value="IDA"> IDA </option>
                    </select>
                </div> -->
                <div>ORIGEN</div>
                <div class="row w-100">

                    <div class="col-md-5">
                        <select class="selectpicker select-provincia" data-live-search="true"
                            title="Selecciona una provincia" data-ciudad="#idCiudad1" required disabled>
                            <option value="{{$provinciaOrigen->id}}"> {{$provinciaOrigen->nombre}} </option>
                        </select>
                    </div>
                    <div class="col-md-5">
                        <select class="selectpicker select-ciudad" data-live-search="true" title="Selecciona una ciudad"
                            id="idCiudad1" name="origen" required disabled>
                            <option value="{{$ciudadOrigen->id}}"> {{$ciudadOrigen->nombre}} </option>
                        </select>
                    </div>
                </div>
                <div>DESTINO</div>
                <div class="row w-100">
                    <div class="col-md-5">
                        <select class="selectpicker select-provincia" data-live-search="true"
                            title="Selecciona una provincia" data-ciudad="#idCiudad2" required>
                            <option value="0"> Seleccione una provincia</option>
                            @foreach ($provincias as $prov)
                                <option value="{{ $prov->id }}">{{ $prov->nombre }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-5">
                        <select class="selectpicker select-ciudad" data-live-search="true" title="Selecciona una ciudad"
                            id="idCiudad2" name="destino" required>
                            <option value="0"> Seleccione una ciudad</option>
                        </select>
                    </div>

                </div>
                <div>
                    <a href="#" id="btnAgregarParada" class="btn btn-primary">+ Añadir parada</a>
                </div>
                <button type="submit" id="btnConfirmar" data-bs-toggle="modal" data-bs-target="#miModal"
                    class="btn btn-primary">Confirmar</button>
            </form>
        </div>
        <div id="ordenParadas" class="row w-5" style="height:60px">
        </div>
        <div id="contenedorParadas" class="wrapper w-55">
        </div>
    </div>

    <!-- POP UP -->
    <div class="modal fade" id="miModal" tabindex="-1" aria-labelledby="miModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>

                <div class="modal-body" id="contenedor-error">
                    <div>Faltan completar campos obligatorios.</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>

                <div class="modal-body" id="contenedor-form">
                    <form action="{{ route('recorridos.store') }}" method="POST">
                        @csrf
                        <table id="tableResumenRecorrido">
                            <thead>
                                <tr>
                                    <th>ORIGEN</th>
                                    <th>DESTINO</th>
                                    <th>CANT DE HORAS ENTRE PARADAS</th>
                                </tr>
                            </thead>

                            <tbody></tbody>
                        </table>
                        <input type="hidden" name="ciudadesParadas" id="inputCiudades">
                        <div class="modal-footer">
                            <button type="submit" id="btnGuardar" class="btn btn-primary">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection


@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js"></script>
    <script>
        var provincias = @json($provincias);
        var urlDatosCiudades = "{{ route('datosciudades') }}";
        const el = document.querySelector('.wrapper');
        Sortable.create(el, {
            animation: 150,
            onEnd: function () {
                const orden = [...el.children].map(item => item.dataset.id);
            }

        });
    </script>
    <script src="{{ asset('js/vistas/recorridos/createRecorrido.js') }}">
    </script>
    <script src="{{ asset('js/selects/provincias-ciudades.js') }}"></script>
@endpush
