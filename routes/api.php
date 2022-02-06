<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware'=>['auth:sanctum', 'admin'], 'prefix'=>'admin', 'namespace'=>'Admin'], function () {
    Route::resource('company', CompanyController::class);
    Route::resource('employee', EmployeeController::class);
});
Route::group(['middleware'=>['auth:sanctum', 'company'], 'prefix'=>'company', 'namespace'=>'Company'], function () {
    Route::resource('employers', EmployerController::class);
    Route::resource('companyName', CompanyNameController::class);
});


Route::get('Company/', [CompanyController::class, 'index']);
Route::get('employee/', [EmployeeController::class, 'index']);
Route::post('register/', [AuthController::class, 'register']);
Route::post('login/', [AuthController::class, 'login']);
