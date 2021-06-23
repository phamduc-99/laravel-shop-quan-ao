<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;


class User extends Authenticatable
{
   protected $fillable = [
        'fullname', 'email', 'phone','address'
   ];
 /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
   public function info()
   {
       return $this->hasOne(Info::class, 'users_id', 'id');
   }
   public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = Hash::make($value);
    }

}
