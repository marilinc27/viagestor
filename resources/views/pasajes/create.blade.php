@push('styles')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
@endpush
@extends('layouts.app')

@section('content')
    <section class="container my-4">
        <div class="card shadow-lg">
            <div class="card-header bg-verde-claro  text-white">
                <h5><i class="bi bi-geo-alt-fill me-2"></i>Destino: <strong>{{ request()->get('destino') }}</strong></h5>
                <p class="mb-1"><i class="bi bi-calendar-event me-2"></i>Fecha de salida:
                <span id="fechaSalidaTexto"> Cargando...</span></p>
                <p><i class="bi bi-calendar-check me-2"></i>Fecha de llegada: <span id="fechaLlegadaTexto">Cargando...</span></p>
            </div>
            <div class="row g-0">
                <div class="col-md-6 p-4 border-end">
                    <h5 class="text-center mb-3"><i class="bi bi-person-plus-fill me-2"></i>Agregar pasajero</h5>
                    <form action="{{ route('pasajes.store') }}" method="POST" id="formPasajes" class="mx-auto">
                        @csrf
                        <div class="mb-3">
                            <label for="nombre" class="form-label"></i>Nombre</label>
                            <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre del pasajero">
                        </div>
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido</label>
                            <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Apellido del pasajero">
                        </div>
                        <div class="mb-3">
                            <label for="dni" class="form-label">DNI</label>
                            <input type="number" class="form-control" name="dni" id="dni" placeholder="Número de documento">
                        </div>
                        <div class="mb-3">
                            <label for="butaca" class="form-label"><i class="bi bi-chair me-1"></i>Butaca nro</label>
                            <select id="butaca" class="form-select">
                                <option value="0">Seleccione una butaca</option>
                                @foreach ($butacas as $unaButaca)
                                    <option value="{{ $unaButaca }}">{{ $unaButaca }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="descuento" class="form-label"><i class="bi bi-percent me-1"></i>Descuento</label>
                            <select id="descuento" class="form-select" disabled>
                                <option value="0">Seleccione un descuento</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <div class="text-end fs-5">
                                <i class="bi bi-cash-coin me-1"></i>Precio final: $<span id="precioFinal">{{ request()->get('precio') }}</span>
                            </div>
                        </div>

                        {{-- Campos ocultos --}}
                        <input type="hidden" name="pasajeros" id="pasajeros">
                        <input type="hidden" name="fechaSalida" value="{{ request()->get('salida') }}">
                        <input type="hidden" name="fechaLlegada" value="{{ $llegada }}">
                        <input type="hidden" name="paradaDestino" value="{{ request()->get('id') }}">
                        <input type="hidden" name="viaje" value="{{ request()->get('viaje') }}">
                        <input type="hidden" name="total" id="total">
                        <input type="hidden" name="disponibilidad" id="disponibilidad">

                        <div class="d-grid">
                            <button class="btn btn-verde" id="btnAgregarPasajero"><i class="bi bi-plus-circle me-1"></i>Añadir</button>
                        </div>
                    </form>
                </div>

                <div class="col-md-6 p-4">
                    <h5 class="text-center"><i class="bi bi-people-fill me-2"></i>Pasajeros agregados</h5>
                    <div class="border rounded p-2 mb-3" style="min-height: 200px;" id="contenedorPasajeros"></div>
                    <div class="text-end fs-5">
                        <i class="bi bi-currency-dollar me-1"></i><strong>TOTAL:</strong> $<span id="precioTotal">0</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-end mt-3">
            <button id="btnConfirmar" class="btn btn-verde-confirmar">
                <i class="bi bi-check2-circle me-1"></i>Confirmar
            </button>
        </div>
    </section>
@endsection

@push('scripts')
   <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment/locale/es.js"></script>
    <script>
        var idViaje = {{ request()->get('viaje') }}
        var disponibilidad = {{ request()->get('pasajes') }}
        var precio = {{ request()->get('precio') }}
    </script>
    <script src="{{ asset('js/vistas/pasajes/createPasajes.js') }}"></script>
    <script src="{{ asset('js/selects/disponibilidadButacas.js') }}"></script>

    <script>
        moment.locale('es'); // Establece el idioma a español

        const fechaSalida = moment("{{ request()->get('salida') }}");
        const fechaLlegada = moment("{{ $llegada }}");

        document.getElementById('fechaSalidaTexto').innerText = fechaSalida.format('D [de] MMMM [de] YYYY [a las] HH:mm');
        document.getElementById('fechaLlegadaTexto').innerText = fechaLlegada.format('D [de] MMMM [de] YYYY [a las] HH:mm');
    </script>


@endpush
