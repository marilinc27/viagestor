<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Viagestor</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    <link rel="stylesheet" href="{{ asset('css/colores.css') }}">
    @stack('styles')

    <style>
        .submenu {
            display: none;
            padding-left: 1rem;
        }

        .submenu.show {
            display: block;
        }
    </style>
</head>

<body>

    <div class="sidebar d-flex flex-column min-vh-100 bg-verde-oscuro p-0">
        <div class="text-center">
            <a href="{{ route('home') }}">
                <img src="{{ asset('img/logotipoiconoblanco.png') }}" alt="Logo" width="100" class="w-75">
            </a>
        </div>

        <nav class="nav flex-column d-flex justify-content h-100">
            <a class="nav-link {{ request()->routeIs('home') ? 'active bg-verde' : '' }}" href="{{ route('home') }}">
                <i class="bi bi-house-door me-2"></i>Inicio
            </a>
            <a class="nav-link {{ request()->routeIs('pasajes.index') ? 'active bg-verde' : '' }}"
                href="{{ route('pasajes.index') }}">
                <i class="bi bi-ticket-perforated me-2"></i>{{ __('Venta de pasajes') }}
            </a>
            @if (session()->get('idrol') == 1)
            <div>
                <a class="nav-link menu-toggle" href="javascript:void(0)">
                    <i class="bi bi-truck-front me-2"></i>{{ __('Gestionar recorridos y viajes') }}</a>
                <ul class="submenu list-unstyled">
                    <li><a class="nav-link" href="{{ route('viajes.create') }}">Registrar viaje</a></li>
                    <li><a class="nav-link" href="{{ route('viajes.index') }}">Gestion e historial de viajes</a></li>
                    <li><a class="nav-link" href="{{ route('recorridos.index') }}">Gestion de recorridos</a></li>
                    <li><a class="nav-link" href="{{ route('colectivos.index') }}">Registrar colectivos</a></li>
                </ul>
            </div>
            <div>
                <a class="nav-link menu-toggle" href="javascript:void(0)">
                    <i class="bi bi-bar-chart-line me-2"></i>{{ __('Reportes') }}</a>
                <ul class="submenu list-unstyled">
                    <li><a class="nav-link" href="{{ route('reportes.pasajes') }}">Pasajes vendidos por día</a></li>
                    <li><a class="nav-link" href="{{ route('reportes.destinos') }}">Destinos más concurridos</a></li>
                </ul>
            </div>
            <div>
                <a class="nav-link menu-toggle" href="javascript:void(0)">
                    <i class="bi bi-gear me-2"></i>{{ __('Administrador') }}</a>
                <ul class="submenu list-unstyled">
                    <li><a class="nav-link" href=" {{ route('empleados.index') }} ">Empleados</a></li>
                    <li><a class="nav-link" href="#">Gestionar descuentos</a></li>
                </ul>
            </div>
            @endif
            <div class="mt-auto">
                <a class="nav-link" href="{{ route('logout') }}"
                    onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    <i class="bi bi-box-arrow-right me-2"></i>
                    {{ __('Cerrar sesión') }}
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="GET" class="d-none">
                    @csrf
                </form>
            </div>
        </nav>
    </div>

    <main class="main-content bg-gris-claro">
        <div class="p-3 mb-4 bg-light rounded-3">
            <div class="container-fluid">
                @if (session('success'))
                    <div class="alert alert-success" role="alert">
                        {{ session('success') }}
                    </div>
                @endif

                @if (session('error'))
                    <div class="alert alert-danger" role="alert">
                        {{ session('error') }}
                    </div>
                @endif

                @yield('content')
            </div>
        </div>
    </main>

    {{-- JS --}}

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script>
        $(document).ready(function () {

            $('.submenu').hide(); // Asegura que estén ocultos al cargar

            $('.menu-toggle').on('click', function () {
                $(this).next('.submenu').slideToggle(200); // Despliegue suave en 200ms
            });
        });
    </script>

    @stack('scripts')

</body>

</html>
