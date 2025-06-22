@push('styles')
    <style>
        .terminal {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 2px solid #ddd;
            border-radius: 10px;
            background-color: #f4f4f4;
        }

        .detalle-pago {
            background: #ffffff;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .detalle-pago h5 {
            margin-bottom: 10px;
            font-weight: bold;
        }

        .resultado {
            margin-top: 20px;
        }

        .loading {
            display: none;
            text-align: center;
        }
    </style>
@endpush

@extends('layouts.app')

@section('content')
    <div class="terminal">
        <h4>Simulación POSNET</h4>

        <!-- Detalles del pago -->
        <div class="detalle-pago" id="detallePago">
            <h5>Detalles del Pago</h5>
            <p><strong>Origen:</strong> {{ $detalleViaje->origen }}  </p>
            <p><strong>Destino:</strong> {{ $detalleViaje->destino }}</p>
            <p><strong>Cantidad de pasajes:</strong> x{{ $pasajesVendidos }} </p>
            <p><strong>Fecha de pago:</strong> {{ date('d/m/Y') }}</p>
        </div>

        <form id="formPago">
            @csrf

            <div class="form-group">
                <label for="monto">Monto a cobrar ($)</label>
                <input type="number" class="form-control" id="monto" name="monto" disabled value="{{ $precioTotal }}">
            </div>
            <button type="submit" class="btn btn-primary w-100 mt-2">Enviar al POSNET</button>
        </form>

        <div class="loading mt-3">
            <span>Procesando pago...</span>
        </div>

        <div class="resultado alert mt-3 d-none" role="alert"></div>
    </div>
@endsection

@push('scripts')
    <script>
        $('#formPago').on('submit', function (e) {
            e.preventDefault();

            $('.loading').show();
            $('.resultado').addClass('d-none').removeClass('alert-success alert-danger');

            setTimeout(() => {
                $('.loading').hide();

                let exito = Math.random() < 0.7;
                if (exito) {
                    $('.resultado')
                        .removeClass('d-none')
                        .addClass('alert-success')
                        .text('Pago aprobado correctamente. Ticket #POS123456');
                } else {
                    $('.resultado')
                        .removeClass('d-none')
                        .addClass('alert-danger')
                        .text('Transacción rechazada. Intente nuevamente.');
                }
            }, 2000);
        });
    </script>
@endpush
