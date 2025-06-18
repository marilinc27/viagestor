<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

class ViajeSeeder extends BaseSeeder
{
    public function run()
    {
        for ($i = 0; $i < 30; $i++) {
            DB::table('viajes')->insert([
                'id_recorrido' => $this->faker->numberBetween(1, 10),
                'id_colectivo' => $this->faker->numberBetween(1, 20),
                'fecha_salida' => $this->faker->dateTimeBetween('-1 month', '+1 month')->format('Y-m-d'),
                'hora_salida' => $this->faker->time('H:i:s'),
                'estado' => $this->faker->numberBetween(0, 1),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
        }
    }
}