@php
    // Si $empleado existe, estamos en edición, sino en creación
    $isEdit = isset($empleado);
@endphp
<div class="mb-3">
    <a href="{{ route('empleados.index') }}" class="btn btn-secondary">← Volver</a>
</div>
<form action="{{ $isEdit ? route('empleados.update', $empleado->id) : route('empleados.store') }}" method="POST">
    @csrf
    @if ($isEdit)
        @method('PUT')
    @endif

    <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" name="nombre" id="nombre" class="form-control @error('nombre') is-invalid @enderror"
            required value="{{ old('nombre') }}">
    </div>
    @error('nombre')
        <span class="text-danger" role="alert">
            <strong>{{ $message }}</strong>
        </span>
    @enderror

    <div class="mb-3">
        <label for="apellido" class="form-label">Apellido</label>
        <input type="text" name="apellido" id="apellido"
            class="form-control @error('apellido') is-invalid @enderror" required value="{{ old('apellido') }}">
    </div>
    @error('apellido')
        <span class="text-danger" role="alert">
            <strong>{{ $message }}</strong>
        </span>
    @enderror
    <div class="mb-3">
        <label for="email" class="form-label">Correo electrónico</label>
        <input type="email" name="email" id="email" class="form-control @error('email') is-invalid @enderror"
            required value="{{ old('email') }}">
    </div>
    @error('email')
        <span class="text-danger" role="alert">
            <strong>{{ $message }}</strong>
        </span>
    @enderror
    <div class="mb-3">
        <label for="tipo_usuario" class="form-label">Tipo de usuario</label>
        <select name="tipo_usuario" id="tipo_usuario" class="form-control" required>
            <option value="">-- Seleccionar --</option>
            <option value="1"
                {{ old('tipo_usuario') == '1' ? 'selected' : '' }}>
                Administrador</option>
            <option value="2"
                {{ old('tipo_usuario') == '2' ? 'selected' : '' }}>Vendedor
            </option>
        </select>
    </div>
    @error('tipo_usuario')
        <span class="text-danger" role="alert">
            <strong>{{ $message }}</strong>
        </span>
    @enderror

    <div class="mb-3">
        <label for="password" class="form-label">{{ __('Contraseña') }}</label>
        <input type="password" class="form-control @error('password') is-invalid @enderror" name="password"
            id="password" value="" placeholder="Contraseña" required>
    </div>
    @error('password')
        <span class="text-danger" role="alert">
            <strong>{{ $message }}</strong>
        </span>
    @enderror
    <div class="mb-3">
        <label for="password" class="form-label">{{ __('Confirmar contraseña') }}</label>
        <input type="password" class="form-control @error('password') is-invalid @enderror" name="password_confirmation"
            id="password_confirmation" value="" placeholder="Confirmar contraseña" required>
    </div>
    @error('password_confirmation')
        <span class="text-danger" role="alert">
            <strong>{{ $message }}</strong>
        </span>
    @enderror
    <button class="btn btn-primary" type="submit">{{ __('Guardar') }}</button>
</form>
