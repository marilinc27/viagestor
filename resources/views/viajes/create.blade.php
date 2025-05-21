@extends('layouts.app')

@section('content')
    <section class="row">
        <form id="form" class="col-12" action="{{ route('viajes.store') }}" type="POST" >
            @csrf
            <label for="">HOLA</label>
            <input type="text" name="" id="">
            <select id="select-provincia" name="state" class="col-4">
                <option value="">Seleccion una provincia</option>
                @foreach ($provincias as $prov)
                    <option value="{{ $prov->id }}">{{ $prov->nombre }}</option>
                @endforeach
            </select>

            <select id="select-ciudad" name="ciudad" class="col-4">
            </select>
        </form>

    </section>
@endsection
@push('scripts')
    <script>
        var urlDatosCiudades = "{{ route('datosciudades') }}";
    </script>
    <script src="{{ asset('js/selects/viajes.js') }}"></script>
@endpush
