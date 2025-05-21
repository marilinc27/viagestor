@extends('layouts.app')

@section('content')
<h1 class="display-5 fw-bold">Hola, {{ auth()->user()->name }}</h1>
<button class="btn btn-primary btn-lg" type="button">Dashboard</button>
@endsection