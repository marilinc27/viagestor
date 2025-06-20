<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

class ParadaSeeder extends BaseSeeder
{
    public function run()
    {
        for ($i = 0; $i < 50; $i++) {
            DB::table('paradas')->insert([
                'id_recorrido' => $this->faker->numberBetween(1, 10),
                'id_ciudad_origen' => $this->faker->numberBetween(1, 368),
                'id_ciudad_destino' => $this->faker->numberBetween(1, 368),
                'estado' => $this->faker->numberBetween(0, 2),
                'hs_tramo' => $this->faker->time('H:i:s'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
        }
    }
}