<?php

use App\Http\Controllers\AuthenticateController;
use App\Http\Controllers\CiudadController;
use App\Http\Controllers\ViajeController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecorridoController;
use App\Http\Controllers\ColectivoController;
use App\Http\Controllers\ParadaController;
use App\Http\Controllers\PasajeController;
use App\Http\Controllers\EmpleadoController;
use App\Http\Controllers\ReporteController;


// Route::get('/', function () {
//     return view('');
// });
//RUTAS AUTH
Route::get('/', [AuthenticateController::class, 'index'])->name('login');
Route::post('post-login', [AuthenticateController::class, 'postLogin'])->name('login.post');
Route::get('registration', [AuthenticateController::class, 'registration'])->name('register');
Route::post('post-registration', [AuthenticateController::class, 'postRegistration'])->name('register.post');
Route::get('logout', [AuthenticateController::class, 'logout'])->name('logout');
Route::get('home', [AuthenticateController::class, 'dashboard'])->name('home');

//RUTAS VIAJE
Route::resource('viajes', ViajeController::class);
Route::post('/datosviaje',[ViajeController::class,"datosviaje"])->name('datosviaje');

//RUTAS PARADAS
Route::resource('paradas', ParadaController::class);

//RUTAS RECORRIDOS
Route::resource('recorridos', RecorridoController::class);
Route::post('/recorridos', [RecorridoController::class, 'store'])->name('recorridos.store');
Route::post('/datosrecorridos',action:[RecorridoController::class, 'getDatosRecorrido'])->name('datosrecorridos');

Route::post('/datosdestino',[RecorridoController::class,"datosDestino"])->name('datosdestino');

//RUTAS CIUDADES
Route::post('/datosciudades',[CiudadController::class,"datosCiudades"])->name('datosciudades');

//RUTAS COLECTIVOS
Route::resource('colectivos', ColectivoController::class);
Route::post('/datosColectivo',[ColectivoController::class,"datosColectivo"])->name('datosColectivo');
Route::post('/datoscolectivosdisponibles',[ColectivoController::class,"datosColectivosDisponibles"])->name('datoscolectivosdisponibles');

Route::resource('pasajes', PasajeController::class);

//RUTAS EMPLEADOS
Route::resource('empleados', EmpleadoController::class);
Route::post('/datosEmpleado',[EmpleadoController::class,"datosEmpleado"])->name('datosEmpleado');

//REPORTES
Route::get('/reportes/pasajes-vendidos', [ReporteController::class, 'pasajesVendidos'])->name('reportes.pasajes');
Route::get('/reportes/destinos-populares', [ReporteController::class, 'destinosPopulares'])->name('reportes.destinos');