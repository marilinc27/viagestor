<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Empleado;
use App\Models\User;
use Illuminate\Support\Facades\Hash as FacadesHash;

class EmpleadoController extends Controller
{
    //

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $variable = "hola";
        return view("empleados.index", compact("variable"));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('empleados.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required|string|max:255',
            'apellido' => 'required|string|max:255',
            'email' => 'required|email|unique:usuarios,email|unique:users,email',
            'tipo_usuario' => 'required|integer',
            'password' => 'required|string|min:6',
        ]);

        // Crear el empleado
        $empleado = Empleado::create([
            'nombre' => $request->nombre,
            'apellido' => $request->apellido,
            'email' => $request->email,
            'tipo_usuario' => $request->tipo_usuario,
            'estado' => 2, // activo por defecto
        ]);

        // Crear el usuario (para login)
        User::create([
            'name' => $request->nombre . ' ' . $request->apellido,
            'email' => $request->email,
            'password' => FacadesHash::make($request->contrasenia),
        ]);

        return redirect()->route('empleados.index')->with('success', 'Empleado creado correctamente');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //datosEmpleado
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Empleado $empleado)
    {
        return view('empleados.edit', compact('empleado'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function datosEmpleado(){
        $empleados = Empleado::get();
        return response()->json(['data' => $empleados]);
    }
}
