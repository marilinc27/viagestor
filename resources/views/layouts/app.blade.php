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
    @stack('styles')
</head>

<body>

    <div class="sidebar">
        <div class="mb-4 text-center">
            <a href="{{ route('home') }}">
                <img src="{{ asset('img/logotipoicono.png') }}" alt="Logo" width="100">
            </a>
        </div>

        <nav class="nav flex-column">
            <a class="nav-link" href="{{ route('home') }}">{{ __('Pasajes') }}</a>
            <a class="nav-link" href="{{ route('colectivos.index') }}">{{ __('Colectivos') }}</a>
            <a class="nav-link" href="{{ route('home') }}">{{ __('Reportes') }}</a>
            <div class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">{{ __('Viajes') }}</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="{{ route('viajes.index') }}">Listado de viajes</a></li>
                    <li><a class="dropdown-item" href="{{ route('recorridos.index') }}">Listado de recorridos</a></li>
                </ul>
            </div>
            <a class="nav-link" href="{{ route('logout') }}"
                onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                {{ __('Cerrar sesión') }}
            </a>
            <form id="logout-form" action="{{ route('logout') }}" method="GET" class="d-none">
                @csrf
            </form>
        </nav>
    </div>

    <main class="main-content">
        <div class="p-5 mb-4 bg-light rounded-3">
            <div class="container-fluid py-5">
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

    <footer class="text-center py-3 bg-light border-top">
        <p class="mb-0">&copy; 2025 Viagestor. Todos los derechos reservados.</p>
    </footer>

    {{-- JS --}}
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    @stack('scripts')
</body>

</html>
