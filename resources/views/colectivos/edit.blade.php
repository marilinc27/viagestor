@extends('layouts.app')

@section('content')
    <div class="container">
        <main>
            <div class="row g-5">
                <div class="col-md-7 col-lg-8">
                    <h4 class="mb-3">Editar colectivo</h4>
                    @include('colectivos._form')
                </div>
            </div>
        </main>
    </div>
@endsection