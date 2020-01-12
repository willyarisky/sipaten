<?php
Route::get('/', 'AppController@index')->name('index');
Route::post('/analyze', 'AppController@analyze');

Auth::routes([ 'register' => false ]);

Route::group([
    'middleware' => ['auth'],
    'prefix' => 'admin',
    'as' => 'admin.',
    'namespace' => 'Admin'],
    function () {
        Route::get('/', 'DiseaseController@index')->name('dashboard');
        Route::resource('diseases', 'DiseaseController');
    }
);