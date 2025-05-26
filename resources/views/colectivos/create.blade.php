@extends('layouts.app')

@section('content')

        <div class="container">
            <main>
                <div class="row g-5">
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Ingreso de un nuevo colectivo</h4>
                        <form action="{{ route('colectivos.store') }}" method="POST">
                            @csrf
                            <div class="row g-3">
                                <div class="col-sm-6"> <label for="nro_colectivo" class="form-label">Número de
                                        colectivo</label>
                                    <input type="number" class="form-control @error('nroColectivo') is-invalid @enderror" id="nro_colectivo" name="nro_colectivo" placeholder=""
                                        value="" required>
                                    @error('nro_colectivo')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-sm-6"> <label for="cant_butacas" class="form-label">Cantidad de
                                        butacas</label> <input type="number" class="form-control @error('cant_butacas') is-invalid @enderror" id="cant_butacas" name="cant_butacas"
                                        placeholder="" value="" required>
                                    @error('cant_butacas')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-12"> <label for="servicios" class="form-label">Servicios ofrecidos</label>
                                    <input type="text" class="form-control @error('cantButacas') is-invalid @enderror" id="servicios" name="servicios"
                                        placeholder="Cafe, Cena, Desayuno">
                                    @error('servicios')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>

                            <hr class="my-4"> <button class="w-100 btn btn-primary btn-lg my-4" type="submit">Registrar colectivo</button>
                        </form>
                    </div>
                </div>
            </main>
        </div>
    @endsection
