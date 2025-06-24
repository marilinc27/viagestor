@extends('layouts.app')

@section('content')
<div class="container py-4">
    <div class="row align-items-center mb-4">
        <div class="col-md-8">
            <h1 class="display-5 fw-bold">Hola, {{ auth()->user()->name }}</h1>
            <p class="lead">Bienvenido/a a tu panel de control. Desde aquí podés acceder a las funciones principales del sistema.</p>
        </div>
        <div class="col-md-4 text-center">
            <!-- Espacio para imagen de usuario o ilustración -->
            <img src="{{ asset('img/img-bus.jpg') }}" alt="Dashboard" class="img-fluid rounded" style="max-height: 200px;">
        </div>
    </div>
@endsection
