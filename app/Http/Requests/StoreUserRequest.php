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
            'name'  => ['required'],
            'email' => ['required', 'email', 'unique:users'],
            'password' => ['required', 'confirmed'],
            'password_confirmation' => ['required'],
        ];
    }

    public function messages()
    {
        return [
            'password.confirmed' => 'Las contraseñas no coinciden.',
            'email.unique' => 'Ya existe este correo.',
            'password.required' => 'El campo contraseña es obligatorio',
            'name.required' => 'El campo nombre es obligatorio',
            'password_confirmation.required' => 'El campo confirmar contraseña es obligatorio'

        ];
    }
}
