<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Empleado;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use App\Http\Requests\StoreUserRequest;
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
    public function store(StoreUserRequest $request): RedirectResponse
    {
        $validatedData = $request->validated();

        /*$request->validate([
            'nombre' => 'required|string|max:255',
            'apellido' => 'required|string|max:255',
            'email' => 'required|email|unique:usuarios,email|unique:users,email',
            'tipo_usuario' => 'required|integer',
            'password' => 'required|string|min:6',
        ]);*/

        // Crear el usuario (para login)
        User::create([
            'name' => $validatedData['nombre'] . " " . $validatedData['apellido'],
            'email' => $validatedData['email'],
            'tipo_usuario' => $validatedData['tipo_usuario'],
            'password' => FacadesHash::make($validatedData['password']),
            'estado' => 2, // activo por defecto
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
    public function update(Request $request)
    {
        // 

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
        $usuario = User::find($id);

        User::updateEstado($usuario->id, 1);
        
        return response()->json(['success' => true, 'message' => 'Empleado dado de baja correctamente.']);
    }

    public function datosEmpleado()
    {
        $empleados = User::get();
        return response()->json(['data' => $empleados]);
    }

    public function reactivar($id)
    {
        $usuario = User::find($id);

        if (!$usuario) {
            return response()->json(['success' => false, 'message' => 'Empleado no encontrado.'], 404);
        }

        User::updateEstado($usuario->id, 2);

        return response()->json(['success' => true, 'message' => 'Empleado reactivado correctamente.']);
    }
}
