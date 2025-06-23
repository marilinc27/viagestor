<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'tipo_usuario',
        'password',
        'estado'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function tipoUsuario()
    {
        return $this->belongsTo(TiposUsuarios::class, 'tipo_usuario');
    }

    public static function get()
    {
        $query = self::select(
            'users.id',
            'users.name',
            'users.email',
            'users.estado',
            'tu.tipo'
        )
            ->join('tipos_usuarios as tu', 'tu.id', 'users.tipo_usuario');

        return $query->get();
    }
    public static function updateEstado($id, $estado)
    {
        return self::where('id', $id)
            ->update([
                'estado' => $estado,
            ]);
    }
}
