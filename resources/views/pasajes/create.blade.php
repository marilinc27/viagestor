@push('styles')

@endpush

@extends('layouts.app')

@section('content')
    <section class="d-flex w-100">
        <div class="w-50">
            <div>
                <p>Destino: {{ request()->get('destino') }}</p>
                <p>Fecha de salida: {{ request()->get('salida') }}</p>
                <p>Fecha de llegada: {{ $llegada }}</p>
            </div>
            <div class="w-50">
                <form action="{{ route('pasajes.store') }}" method="POST" id="formPasajes">
                    @csrf
                    <div class="mb-3">
                        <label for="">Nombre</label>
                        <input type="text" class="form-control w-100" name="nombre" id="nombre">
                    </div>
                    <div class="mb-3">
                        <label for="">Apellido</label>
                        <input type="text" class="form-control w-100" name="apellido" id="apellido">
                    </div>
                    <div class="mb-3">
                        <label for="">DNI</label>
                        <input type="number" class="form-control w-100" name="dni" id="dni">
                    </div>
                    <div class="mb-3">
                        <label for="">Butaca nro</label>
                        <select id="butaca" class="form-control">
                            <option value="0"> Seleccione una butaca</option>
                            @foreach ($butacas as $unaButaca)
                                <option value="{{ $unaButaca }}">{{ $unaButaca }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="">Descuento</label>
                        <select id="butaca" class="form-control" disabled>
                            <option value="0"> Seleccione un descuento</option>
                        </select>
                    </div>
                    <div>
                        <div>Precio final: $<span id="precioFinal">{{ request()->get('precio') }}</span></div>
                    </div>
                    <input type="hidden" class="" name="pasajeros" id="pasajeros">
                    <input type="hidden" class="" name="fechaSalida" id="dni" value="{{ request()->get('salida') }}">
                    <input type="hidden" class="" name="fechaLlegada" id="dni" value="{{ $llegada }}">
                    <input type="hidden" class="" name="paradaDestino" id="paradaDestino" value="{{ request()->get('id') }}">
                    <input type="hidden" class="" name="viaje" id="viaje" value="{{ request()->get('viaje') }}">
                    <input type="hidden" class="" name="total" id="total">
                    <input type="hidden" class="" name="disponibilidad" id="disponibilidad">
                    <div>
                        <button class="btn btn-primary" id="btnAgregarPasajero">Añadir</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="w-50">
            <div class="w-100">PASAJEROS</div>
            <div class="border" id="contenedorPasajeros">
            </div>
            <div>TOTAL: $<span id="precioTotal">0</span></div>
        </div>

    </section>
    <section>

        <div><button id="btnConfirmar" class="btn btn-primary">Confirmar</button></div>

    </section>

@endsection
@push('scripts')
    <script>
        var idViaje = {{ request()->get('viaje') }}
        var disponibilidad = {{ request()->get('pasajes') }}
        var precio = {{ request()->get('precio') }}
    </script>
    <script src="{{ asset('js/vistas/pasajes/createPasajes.js') }}"></script>
    <script src="{{ asset('js/selects/disponibilidadButacas.js') }}"></script>
@endpush
