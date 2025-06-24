<?php

use App\Models\Colectivo;
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Models\User;

beforeEach(function () {
    $this->actingAs(User::factory()->create());
});

uses(RefreshDatabase::class);

/*it('muestra la base de datos actual', function () {
    dd(config('database.connections.mysql.database'));
});*/

it('confirma entorno de prueba', function () {
    expect(app()->environment())->toBe('testing');
});


it('puede registrar un colectivo válido', function () {
    $response = $this->post('/colectivos', [
        'nro_colectivo' => '456',
        'cant_butacas' => 40,
        'estado' => 1,
        'servicios' => ['WIFI', 'TV'],
    ]);

    $response->assertRedirect('/colectivos');

    expect(Colectivo::where('nro_colectivo', '456')->exists())->toBeTrue();
});


it('no puede registrar colectivo con campos obligatorios vacíos', function () {
    $response = $this->post('/colectivos', []);

    $response->assertSessionHasErrors(['nro_colectivo', 'cant_butacas']);
});


it('no puede registrar colectivo duplicado', function () {
    Colectivo::create([
        'nro_colectivo' => '789',
        'cant_butacas' => 30,
        'estado' => 1,
        'servicios' => [],
    ]);

    $response = $this->post('/colectivos', [
        'nro_colectivo' => '789',
        'cant_butacas' => 45,
    ]);

    $response->assertSessionHasErrors('nro_colectivo');
});

it('no permite registrar colectivo con menos de 20 butacas', function () {
    $response = $this->post('/colectivos', [
        'nro_colectivo' => '999',
        'cant_butacas' => 19,
        'estado' => 1,
        'servicios' => [],
    ]);

    expect(Colectivo::where('nro_colectivo', '999')->exists())->toBeFalse();

    /*$response->assertSessionHasErrors(['cant_butacas']);

    expect(Colectivo::where('nro_colectivo', '999')->exists())->toBeFalse();*/
});

//chequeo que puse un minimo de veinte
it('Me permite registrar si tengo el mínimo requerido', function () {
    $response = $this->post('/colectivos', [
        'nro_colectivo' => '111',
        'cant_butacas' => 20,
        'estado' => 1,
        'servicios' => [],
    ]);

    expect(Colectivo::where('nro_colectivo', '111')->exists())->toBeTrue();

    /*$response->assertSessionHasErrors(['cant_butacas']);

    expect(Colectivo::where('nro_colectivo', '999')->exists())->toBeFalse();*/
});

//chequeo que puse un minimo de veinte
it('No me permite registrar cantidad de butacas que no es numérico', function () {
    $response = $this->post('/colectivos', [
        'nro_colectivo' => '222',
        'cant_butacas' => 'jaxnskj',
        'estado' => 1,
        'servicios' => [],
    ]);

    expect(Colectivo::where('nro_colectivo', '222')->exists())->toBeFalse();

});