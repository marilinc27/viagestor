<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;


class PasajeSeeder extends BaseSeeder
{
    public function run()
    {
        for ($i = 0; $i < 100; $i++) {
            DB::table('pasajes')->insert([
                'id_parada' => $this->faker->numberBetween(1, 50),
                'fecha_salida' => $this->faker->dateTimeBetween('-1 month', '+1 month')->format('Y-m-d'),
                'hora_salida' => $this->faker->time('H:i:s'),
                'estado' => $this->faker->numberBetween(0, 2),
                'id_pasajero' => $this->faker->numberBetween(1, 200),
                'nro_butaca' => $this->faker->numberBetween(1, 50),
                'precio_final' => $this->faker->randomFloat(2, 1000, 6000),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
        }
    }
}
