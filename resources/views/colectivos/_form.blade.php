
<form action="{{ isset($colectivo) ? route('colectivos.update', $colectivo) : route('colectivos.store') }}" method="POST">
    @csrf
    @if(isset($colectivo))
        @method('PUT')
    @endif

    <div class="row g-3">
        <div class="col-sm-6">
            <label for="nro_colectivo" class="form-label">Número de colectivo</label>
            <input type="number" 
                   class="form-control @error('nro_colectivo') is-invalid @enderror"
                   id="nro_colectivo" 
                   name="nro_colectivo" 
                   value="{{ old('nro_colectivo', $colectivo->nro_colectivo ?? '') }}" 
                   required>
            @error('nro_colectivo')
                <span class="text-danger" role="alert"><strong>{{ $message }}</strong></span>
            @enderror
        </div>

        <div class="col-sm-6">
            <label for="cant_butacas" class="form-label">Cantidad de butacas</label>
            <input type="number" 
                   class="form-control @error('cant_butacas') is-invalid @enderror"
                   id="cant_butacas" 
                   name="cant_butacas"
                   value="{{ old('cant_butacas', $colectivo->cant_butacas ?? '') }}" 
                   required>
            @error('cant_butacas')
                <span class="text-danger" role="alert"><strong>{{ $message }}</strong></span>
            @enderror
        </div>

        <div class="col-12">
            <label for="servicios" class="form-label">Servicios ofrecidos</label>
            <input type="text" 
                   class="form-control @error('servicios') is-invalid @enderror"
                   id="servicios" 
                   name="servicios"
                   value="{{ old('servicios', $colectivo->servicios ?? '') }}"
                   placeholder="Café, Cena, Desayuno">
            @error('servicios')
                <span class="text-danger" role="alert"><strong>{{ $message }}</strong></span>
            @enderror
        </div>
    </div>

    <hr class="my-4">
    <button class="w-100 btn btn-primary btn-lg my-4" type="submit">
        {{ isset($colectivo) ? 'Actualizar colectivo' : 'Registrar colectivo' }}
    </button>
</form>