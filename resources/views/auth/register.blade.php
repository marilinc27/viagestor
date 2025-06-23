<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        crossorigin="anonymous">
    <style type="text/css">
        body {
            background: #F8F9FA;
        }
    </style>
</head>

<body>

    <section class="bg-light py-3 py-md-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                    <div class="card border border-light-subtle rounded-3 shadow-sm">
                        <div class="card-body p-3 p-md-4 p-xl-5">
                            <div class="text-center mb-3">
                                <a href="#!">
                                    <img src="{{ asset('img/logotipoicono.png') }}" alt="BootstrapBrain Logo"
                                        width="250">
                                </a>
                            </div>
                            <h2 class="fs-6 fw-normal text-center text-secondary mb-4">Registre su cuenta</h2>
                            <form
                                action="{{ route('register.post') }}"
                                method="POST">
                                @csrf
                                @session('error')
                                    <div class="alert alert-danger" role="alert">
                                        {{ $value }}
                                    </div>
                                @endsession

                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" name="nombre" id="nombre"
                                        class="form-control @error('nombre') is-invalid @enderror" required
                                        value="{{ old('nombre') }}">
                                </div>
                                @error('nombre')
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror

                                <div class="mb-3">
                                    <label for="apellido" class="form-label">Apellido</label>
                                    <input type="text" name="apellido" id="apellido"
                                        class="form-control @error('apellido') is-invalid @enderror" required
                                        value="{{ old('apellido') }}">
                                </div>
                                @error('apellido')
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                <div class="mb-3">
                                    <label for="email" class="form-label">Correo electrónico</label>
                                    <input type="email" name="email" id="email"
                                        class="form-control @error('email') is-invalid @enderror" required
                                        value="{{ old('email') }}">
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
                                        <option value="1" {{ old('tipo_usuario') == '1' ? 'selected' : '' }}>
                                            Administrador</option>
                                        <option value="2" {{ old('tipo_usuario') == '2' ? 'selected' : '' }}>
                                            Vendedor
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
                                    <input type="password" class="form-control @error('password') is-invalid @enderror"
                                        name="password" id="password" value="" placeholder="Contraseña" required>
                                </div>
                                @error('password')
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                <div class="mb-3">
                                    <label for="password_confirmation" class="form-label">{{ __('Confirmar contraseña') }}</label>
                                    <input type="password" class="form-control @error('password_confirmation') is-invalid @enderror"
                                        name="password_confirmation" id="password_confirmation" value=""
                                        placeholder="Confirmar contraseña" required>
                                </div>
                                @error('password_confirmation')
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                <button class="btn btn-primary" type="submit">{{ __('Guardar') }}</button>
                            </form>
                            {{-- <form method="POST" action="{{ route('register.post') }}">
              @csrf

              @session('error')
                  <div class="alert alert-danger" role="alert"> 
                      {{ $value }}
                  </div>
              @endsession

              <div class="row gy-2 overflow-hidden">
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="text" class="form-control @error('name') is-invalid @enderror" name="name" id="name" placeholder="name@example.com" required value="{{ old('name') }}">
                    <label for="name" class="form-label">{{ __('Nombre') }}</label>
                  </div>
                  @error('name')
                        <span class="text-danger" role="alert">
                          <strong>{{ $message }}</strong>
                      </span>
                  @enderror
                </div>
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="email" class="form-control @error('email') is-invalid @enderror" name="email" id="email" placeholder="name@example.com" required value="{{ old('email') }}">
                    <label for="email" class="form-label">{{ __('Correo') }}</label>
                  </div>
                  @error('email')
                        <span class="text-danger" role="alert">
                          <strong>{{ $message }}</strong>
                      </span>
                  @enderror
                </div>
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="password" class="form-control @error('password') is-invalid @enderror" name="password" id="password" value="" placeholder="Password" required>
                    <label for="password" class="form-label">{{ __('Contraseña') }}</label>
                  </div>
                  @error('password')
                      <span class="text-danger" role="alert">
                          <strong>{{ $message }}</strong>
                      </span>
                  @enderror
                </div>
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="password" class="form-control @error('password_confirmation') is-invalid @enderror" name="password_confirmation" id="password_confirmation" value="" placeholder="password_confirmation" required>
                    <label for="password_confirmation" class="form-label">{{ __('Confirmar contraseña') }}</label>
                  </div>
                  @error('password_confirmation')
                      <span class="text-danger" role="alert">
                          <strong>{{ $message }}</strong>
                      </span>
                  @enderror
                </div>
                <div class="col-12">
                  <div class="d-grid my-3">
                    <button class="btn btn-primary btn-lg" type="submit">{{ __('Registrase') }}</button>
                  </div>
                </div>
                <div class="col-12">
                  <p class="m-0 text-secondary text-center">Tiene un cuenta? <a href="{{ route('login') }}" class="link-primary text-decoration-none">Iniciar sesion</a></p>
                </div>
              </div>
            </form> --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>

</html>
