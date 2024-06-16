<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PokeMedia;

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

// Route::get('/', function () { 
//     return view('welcome');
// });

//    este '/pokemedia' debe estar en minusculas
Route::get('/pokemedia/{poke}',[PokeMedia::class,'index']);

Route::post('/pokemedia/adicionarPokemon',[PokeMedia::class,'adicionarPokemon']) -> name("pokemon.adicionar");
Route::put('/pokemedia/actualizarPokemon/{id}', [PokeMedia::class, 'actualizarPokemon'])->name('pokemon.actualizar');
Route::get('/pokemedia/eliminarPokemon/{id}', [PokeMedia::class, 'eliminarPokemon'])->name('pokemon.eliminar');

Route::post('/pokemedia/adicionarEntrenador',[PokeMedia::class,'adicionarEntrenador']) -> name("entrenador.adicionar");
Route::put('/pokemedia/actualizarEntrenador/{ci}', [PokeMedia::class, 'actualizarEntrenador'])->name('entrenador.actualizar');
Route::get('/pokemedia/eliminarEntrenador/{ci}', [PokeMedia::class, 'eliminarEntrenador'])->name('entrenador.eliminar');

Route::post('/pokemedia/adicionarCaptura',[PokeMedia::class,'adicionarCaptura']) -> name("captura.adicionar");
Route::put('/pokemedia/actualizarCaptura/{id}', [PokeMedia::class, 'actualizarCaptura'])->name('captura.actualizar');
Route::get('/pokemedia/eliminarCaptura/{id}', [PokeMedia::class, 'eliminarCaptura'])->name('captura.eliminar');