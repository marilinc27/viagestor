<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;

class ColectivoSeeder extends BaseSeeder
{
    public function run()
    {
        $serviciosPosibles = ['WiFi', 'Aire acondicionado', 'Baño', 'Pantalla', 'Reclinables', 'Cargador USB'];

        foreach (range(1, 20) as $i) {
            DB::table('colectivos')->insert([
                'nro_colectivo' => $this->faker->unique()->regexify('[A-Z]{2}[0-9]{3}'),
                'cant_butacas' => $this->faker->numberBetween(20, 60),
                'estado' => $this->faker->numberBetween(0, 1), // 0: inactivo, 1: activo
                'servicios' => implode(', ', $this->faker->randomElements($serviciosPosibles, rand(2, 4))),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}