<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('pasajes', function (Blueprint $table) {
            $table->id();
            $table->integer('id_parada');
            $table->date('fecha_salida');
            $table->time('hora_salida');
            $table->integer('estado');
            $table->integer('id_pasajero');
            $table->integer('nro_butaca');
            $table->double('precio_final');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pasajes');
    }
};
