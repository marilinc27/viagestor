<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;

class PreciosParadasSeeder extends BaseSeeder
{
    public function run()
    {
        $paradas = DB::table('paradas')->pluck('id')->toArray();

        foreach ($paradas as $idParada) {
            DB::table('precios_paradas')->insert([
                'id_parada' => $idParada,
                'precio' => $this->faker->randomFloat(2, 1500, 8500),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}