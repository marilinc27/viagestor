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
        Schema::create('recorridos', function (Blueprint $table) {
            $table->id();
            $table->integer('id_ciudad_origen');
            $table->integer('id_ciudad_destino');
            $table->integer('estado');
            $table->time('hs_total');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('recorridos');
    }
};
