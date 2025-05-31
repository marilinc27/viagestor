<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    {{-- styles propios --}}
    @stack('styles')

</head>

<body>

    <main>
        <div class="container py-4">
            <header class="pb-3 mb-4 border-bottom">
                <div class="row">
                    <div class="col-md-2">
                        <a href="{{ route('home') }}" class="d-flex align-items-center text-dark text-decoration-none">
                            <img src="{{ asset('img/logotipoicono.png') }}" alt="BootstrapBrain Logo" width="100">
                        </a>
                    </div>
                    <div class="col-md-1">
                        <a class="dropdown-item" href="{{ route('home') }}"">
                            {{ __('Pasajes') }}
                        </a>
                    </div>
                                        <div class="col-md-1">
                        <a class="dropdown-item" href="{{ route('colectivos.index') }}"">
                            {{ __('Colectivos') }}
                        </a>
                    </div>
                    <div class="col-md-1">
                        <a class="dropdown-item" href="{{ route('home') }}">
                            {{ __('Reportes') }}
                        </a>
                    </div>
                    <div class="col-md-1 dropdown hover-dropdown">


                        <a class="dropdown-toggle text-dark text-decoration-none" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            {{ __('Viajes') }}
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item" href="{{ route('viajes.index') }}">Listado de viajes</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="{{ route('recorridos.index') }}">Listado de
                                    recorridos</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-2">
                        <a class="dropdown-item" href="{{ route('logout') }}"
                            onclick="event.preventDefault();
                                 document.getElementById('logout-form').submit();">
                            {{ __('Cerrar sesión') }}
                        </a>
                    </div>
                    <form id="logout-form" action="{{ route('logout') }}" method="GET" class="d-none">
                        @csrf
                    </form>
                </div>
        </div>

        </header>

        <div class="p-5 mx-4 mb-4 bg-light rounded-3">
            <div class="container-fluid py-5">

                @session('success')
                    <div class="alert alert-success" role="alert">
                        {{ $value }}
                    </div>
                @endsession
                @session('error')
                    <div class="alert alert-success" role="alert">
                        {{ $value }}
                    </div>
                @endsession

                @yield('content')
            </div>
        </div>

        </div>
    </main>
    {{-- cdn de datables --}}
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    {{-- scripts propios --}}
    @stack('scripts')
</body>
<footer>
    <p>&copy; 2025 Viagestor. Todos los derechos reservados.</p>

</footer>

</html>
