@php
    // Si $empleado existe, estamos en edición, sino en creación
    $isEdit = isset($empleado);
@endphp
<div class="mb-3">
    <a href="{{ route('empleados.index') }}" class="btn btn-secondary">← Volver</a>
</div>
<form action="{{ $isEdit ? route('empleados.update', $empleado->id) : route('empleados.store') }}" method="POST">
    @csrf
    @if($isEdit)
        @method('PUT')
    @endif

    <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input 
            type="text" 
            name="nombre" 
            id="nombre" 
            class="form-control" 
            required 
            value="{{ old('nombre', $isEdit ? $empleado->nombre : '') }}"
        >
    </div>

    <div class="mb-3">
        <label for="apellido" class="form-label">Apellido</label>
        <input 
            type="text" 
            name="apellido" 
            id="apellido" 
            class="form-control" 
            required 
            value="{{ old('apellido', $isEdit ? $empleado->apellido : '') }}"
        >
    </div>

    <div class="mb-3">
        <label for="email" class="form-label">Correo electrónico</label>
        <input 
            type="email" 
            name="email" 
            id="email" 
            class="form-control" 
            required 
            value="{{ old('email', $isEdit ? $empleado->email : '') }}"
        >
    </div>

    <div class="mb-3">
        <label for="tipo_usuario" class="form-label">Tipo de usuario</label>
        <select name="tipo_usuario" id="tipo_usuario" class="form-control" required>
            <option value="">-- Seleccionar --</option>
            <option value="admin" {{ old('tipo_usuario', $isEdit ? $empleado->tipo_usuario : '') == 'admin' ? 'selected' : '' }}>Administrador</option>
            <option value="empleado" {{ old('tipo_usuario', $isEdit ? $empleado->tipo_usuario : '') == 'empleado' ? 'selected' : '' }}>Empleado</option>
            <option value="supervisor" {{ old('tipo_usuario', $isEdit ? $empleado->tipo_usuario : '') == 'supervisor' ? 'selected' : '' }}>Supervisor</option>
        </select>
    </div>

    <div class="mb-3">
        <label for="password" class="form-label">
            {{ $isEdit ? 'Nueva contraseña (dejar en blanco para no cambiarla)' : 'Contraseña' }}
        </label>
        <input 
            type="password" 
            name="password" 
            id="password" 
            class="form-control" 
            {{ $isEdit ? '' : 'required' }}
        >
    </div>

    <button type="submit" class="btn btn-primary">
        {{ $isEdit ? 'Actualizar' : 'Guardar' }}
    </button>
</form>
