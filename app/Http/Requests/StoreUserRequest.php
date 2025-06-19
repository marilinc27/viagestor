<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreUserRequest extends FormRequest
{

    // public function authorize(): bool
    // {
    //     return auth()->check();
    // }

    public function rules(): array
    {
        return [
            'nombre'  => ['required'],
            'apellido'  => ['required'],
            'email' => ['required', 'email', 'unique:users'],
            'password' => ['required', 'confirmed'],
            'tipo_usuario' => ['required', 'integer'],
            'password_confirmation' => ['required'],
        ];
    }

    public function messages()
    {
        return [
            'password.confirmed' => 'Las contraseñas no coinciden.',
            'email.unique' => 'Ya existe este correo.',
            'password.required' => 'El campo contraseña es obligatorio',
            'nombre.required' => 'El campo nombre es obligatorio',
            'apellido.required' => 'El campo nombre es obligatorio',
            'tipo_usuario.required' => 'Debe seleccionar un tipo de perfil',
            'password_confirmation.required' => 'El campo confirmar contraseña es obligatorio'

        ];
    }
}
