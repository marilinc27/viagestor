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
        Schema::create('colectivos', function (Blueprint $table) {
            $table->id();
            $table->string('nro_colectivo');
            $table->integer('cant_butacas');
            $table->integer('estado');
            $table->string('servicios');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('colectivos');
    }
};
