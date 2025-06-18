<form action="{{ isset($colectivo) ? route('colectivos.update', $colectivo) : route('colectivos.store') }}"
    method="POST">
    @csrf
    @if (isset($colectivo))
        @method('PUT')
    @endif
    <div class="mb-3">
    <a href="{{ route('colectivos.index') }}" class="btn btn-secondary">← Volver</a>
</div>

    <div class="row g-3">
        <div class="col-sm-6">
            <label for="nro_colectivo" class="form-label">Número de colectivo</label>
            <input type="text" class="form-control @error('nro_colectivo') is-invalid @enderror" id="nro_colectivo"
                name="nro_colectivo" value="{{ old('nro_colectivo', $colectivo->nro_colectivo ?? '') }}" required>
            @error('nro_colectivo')
                <span class="text-danger" role="alert"><strong>{{ $message }}</strong></span>
            @enderror
        </div>

        <div class="col-sm-6">
            <label for="cant_butacas" class="form-label">Cantidad de butacas</label>
            <input type="number" class="form-control @error('cant_butacas') is-invalid @enderror" id="cant_butacas"
                name="cant_butacas" value="{{ old('cant_butacas', $colectivo->cant_butacas ?? '') }}" required>
            @error('cant_butacas')
                <span class="text-danger" role="alert"><strong>{{ $message }}</strong></span>
            @enderror
        </div>

        <div class="form-check form-switch mt-3">
            <input class="form-check-input" type="checkbox" role="switch" id="estado" name="estado" value="1"
                {{ old('estado', $colectivo->estado ?? 4) ? 'checked' : '' }}>
            <label class="form-check-label" for="estado">Disponible</label>
        </div>

        <div class="col-12 mt-3">
            <label class="form-label d-block">Servicios ofrecidos</label>

            @php
                $todos_servicios = ['WIFI', 'CAMA', 'SEMI-CAMA','CENA', 'TV'];
            @endphp

            @foreach ($todos_servicios as $servicio)
                <div class="form-check form-check-inline">
                    <label>
                        <input class="form-check-input" type="checkbox" name="servicios[]" value="{{ $servicio }}"
                            {{ in_array($servicio, old('servicios', $colectivo->servicios ?? [])) ? 'checked' : '' }}>
                        {{ $servicio }}
                    </label><br>
                </div>
            @endforeach

            @error('servicios')
                <div class="text-danger mt-1"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
    </div>


    <hr class="my-4">
    <div class="d-grid gap-2">
        <button class="btn btn-primary btn-lg" type="submit">
            {{ isset($colectivo) ? 'Actualizar colectivo' : 'Registrar colectivo' }}
        </button>
    </div>
</form>
