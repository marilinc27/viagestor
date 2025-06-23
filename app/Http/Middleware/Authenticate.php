<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo($request)
    {
        Session::flush();
        Session::flash('mensaje', 'Tu sesión ha expirado, por favor inicia sesión de nuevo.');

        return $request->expectsJson() ? null : route('login');
    }
}