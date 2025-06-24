<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreColectivoRequest extends FormRequest
{

    // public function authorize(): bool
    // {
    //     return auth()->check();
    // }

    public function rules(): array
    {
        return [
            'nro_colectivo'  => ['required', 'unique:colectivos,nro_colectivo'],
            'cant_butacas' => ['required', 'numeric', 'gt:19'],
        ];
    }

    public function messages()
    {
        return [
            'nro_colectivo.unique' => 'Ya existe este colectivo.',
            'nro_colectivo.required' => 'El campo para Número de colectivo es obligatorio',
            'cant_butacas.required' => 'La cantidad de butacas es obligatoria',
            'cant_butacas.gt' => 'La cantidad de butacas debe ser un número superior a 20',
            'cant_butacas.numeric' => 'El campo cantidad de butacas debe ser un número.',
        ];
    }
}
