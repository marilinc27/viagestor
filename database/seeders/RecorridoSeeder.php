<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;

class RecorridoSeeder extends BaseSeeder
{
    public function run()
    {
        $ciudades = DB::table('ciudades')->pluck('id')->toArray();

        foreach (range(1, 20) as $i) {
            $origen = $this->faker->randomElement($ciudades);
            do {
                $destino = $this->faker->randomElement($ciudades);
            } while ($destino === $origen);

            DB::table('recorridos')->insert([
                'id_ciudad_origen' => $origen,
                'id_ciudad_destino' => $destino,
                'estado' => $this->faker->numberBetween(0, 1),
                'hs_total' => $this->faker->time('H:i:s'),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}