<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Http\Middleware\AdminMiddleware;
use App\Http\Middleware\VendedorMiddleware;
use App\Http\Middleware\Authenticate;
use Illuminate\Foundation\Http\MiddlewareRegistry;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function ($middleware) {
        //
        $middleware->alias(['auth'], \App\Http\Middleware\Authenticate::class);
        $middleware->alias(['admin'], \App\Http\Middleware\AdminMiddleware::class);
        $middleware->alias(['vendedor'], \App\Http\Middleware\VendedorMiddleware::class);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();


    $app->singleton(
    \Illuminate\Foundation\Http\Middleware\VerifyCsrfToken::class,
    \App\Http\Middleware\VerifyCsrfToken::class
);