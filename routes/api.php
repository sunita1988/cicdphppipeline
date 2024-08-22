<?php
use App\Http\Controllers\MenuController;
use App\Http\Controllers\UserGroupController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


//test
Route::get('/test', [MenuController::class, 'test']);

//test with data
Route::get('/testWithData', [MenuController::class, 'testWithData']);

Route::get('/user-groups', [UserGroupController::class, 'index']);