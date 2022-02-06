<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request){
        $companies = DB::table('company')->select('id')->get();
        foreach ($companies as $company){
            $company_id[]=$company->id;
        }
        $fields = $request->validate([
           'name'=>'required|string',
           'email'=>'required|string|unique:users,email',
           'company_id'=>'required|integer',
           'password'=>'required|string|confirmed'
        ]);
        if(in_array($fields['company_id'], $company_id)){
        $user = User::create([
            'name'=>$fields['name'],
            'email'=>$fields['email'],
            'password'=>bcrypt($fields['password']),
            'company_id'=>$fields['company_id']
        ]);
        $token = $user->createToken('myapptoken')->plainTextToken;
        $response = ['user'=>$user, 'token'=>$token];
        return response($response, 201);
        }else{
            return response('Компания не сушествует');
        }
    }
    public function login(Request $request){
        $fields = $request->validate([
           'email'=>'required|string',
           'password'=>'required'
        ]);
        $user = User::where('email', $fields['email'])->first();
        if (!$user || !Hash::check($fields['password'], $user->password)){
            return response('bad creds', 401);
        }
            $token = $user->createToken('myapptoken')->plainTextToken;
            $response = [
                'user'=>$user,
                'token'=>$token
            ];
            return response($response, 201);
    }
}
