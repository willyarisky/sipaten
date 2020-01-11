<?php

use App\Disease;
use App\Symptom;
use App\MappingSymptom;
use App\MappingSolution;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'AppController@index')->name('index');
Route::post('/analyze', 'AppController@analyze');

Auth::routes([ 'register' => false ]);

Route::group([
    'middleware' => ['auth'],
    'prefix' => 'dashboard',
    'as' => 'admin.',
    'namespace' => 'Admin'],
    function () {
        Route::get('/', 'DiseaseController@index')->name('dashboard');
        Route::resource('diseases', 'DiseaseController');
    }
);

Route::get('/test', function () {
    return MappingSymptom::get();
});