<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\LoginRequest;
use Auth;
class LoginController extends Controller
{
    public function login(){
        return view('backend.login');
    }
    public function postLogin(LoginRequest $request){
        $email =  $request->email;
        $password = $request->password;

        if(Auth::attempt(['email' => $email, 'password' => $password])){
            return redirect()->route('dashboard');
        }else{
            return redirect()->back()->with('error','Sai email hoặc mật khẩu')->withInput();
        }
    }
}
