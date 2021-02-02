<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Auth, Session;

class UserController extends Controller
{
    public function post_login(Request $request){
    	$arrCheck = 
		[
			'email' 	   => $request->username, 
    		'password'     => $request->passw
    	];

    	if (Auth::attempt($arrCheck)) {
		   return redirect(route('index'));
		}else{
			Session::flash('err', 'Username hoặc password không đúng!');
			return redirect(route('login'));
		}
    }

    public function logout(){
    	Auth::logout();
    	return redirect(route('login'));
    }
}
