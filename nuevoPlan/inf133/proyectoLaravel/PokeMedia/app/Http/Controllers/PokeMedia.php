<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PokeMedia extends Controller
{
    //

    public function index($poke)
    {
        $pokemon = DB::select("SELECT * FROM pokemon");
        $entrenador = DB::select("SELECT * FROM Entrenador");
        $captura = DB::select("SELECT * FROM Captura");
        return view("welcome", compact('pokemon', 'entrenador', 'captura'));
    }

    public function adicionarPokemon(Request $request)
    {
        $guardar = DB::select("insert into Pokemon(idPokemon, nombre, tipo, generacion, nroPokemon) values(?, ?, ?, ?, ?)", [$request->id, $request->nombre, $request->tipo, $request->generacion, $request->numero]);
        if ($guardar) {
            return back()->with("Bien");
        } else {
            return back()->with("Mal");
        }
    }
    public function actualizarPokemon(Request $request, $id)
    {
        $actualizar = DB::update("UPDATE pokemon SET nombre = ?, tipo = ?, generacion = ?, nroPokemon = ? WHERE idPokemon = ?", [$request->nombre, $request->tipo, $request->generacion, $request->numero, $id]);
        if ($actualizar) {
            return back()->with('success', 'Pokémon actualizado correctamente.');
        } else {
            return back()->with('error', 'Error al actualizar el Pokémon.');
        }
    }
    public function eliminarPokemon($id)
    {
        $eliminar = DB::delete("DELETE FROM pokemon WHERE idPokemon = ?", [$id]);
        if ($eliminar) {
            return back()->with('success', 'Pokémon eliminado correctamente.');
        } else {
            return back()->with('error', 'Error al eliminar el Pokémon.');
        }
    }

    public function adicionarEntrenador(Request $request)
    {
        $guardar = DB::select("insert into Entrenador(ci, nombre, paterno, region, edad, sexo) values(?, ?, ?, ?, ?, ?)", [$request->ci, $request->nombre, $request->paterno, $request->region, $request->edad, $request->sexo]);
        if ($guardar) {
            return back()->with("Bien");
        } else {
            return back()->with("Mal");
        }
    }
    public function actualizarEntrenador(Request $request, $ci)
    {
        $actualizar = DB::update("UPDATE entrenador SET nombre = ?, paterno = ?, region = ?, edad = ?, sexo = ? WHERE ci = ?", [$request->nombre, $request->paterno, $request->region, $request->edad, $request->sexo, $ci]);
        if ($actualizar) {
            return back()->with('success', 'Entrenador actualizado correctamente.');
        } else {
            return back()->with('error', 'Error al actualizar el Entrenador.');
        }
    }
    public function eliminarEntrenador($ci)
    {
        $eliminar = DB::delete("DELETE FROM entrenador WHERE ci = ?", [$ci]);
        if ($eliminar) {
            return back()->with('success', 'Entrenador eliminado correctamente.');
        } else {
            return back()->with('error', 'Error al eliminar el Entrenador.');
        }
    }

    public function adicionarCaptura(Request $request)
    {
        $guardar = DB::select("insert into Captura(idPokemon, ci, ruta) values(?, ?, ?)", [$request->idPokemon, $request->ci, $request->ruta]);
        if ($guardar) {
            return back()->with("Bien");
        } else {
            return back()->with("Mal");
        }
    }
    public function actualizarCaptura(Request $request, $idPokemon)
    {
        $actualizar = DB::update("UPDATE Captura SET idPokemon = ?, ci = ?, ruta = ? WHERE idPokemon = ?", [$request->idPokemon, $request->ci, $request->ruta, $idPokemon]);
        if ($actualizar) {
            return back()->with('success', 'Captura actualizado correctamente.');
        } else {
            return back()->with('error', 'Captura al actualizar el Entrenador.');
        }
    }
    public function eliminarCaptura($idPokemon)
    {
        $eliminar = DB::delete("DELETE FROM Captura WHERE ci = ?", [$idPokemon]);
        if ($eliminar) {
            return back()->with('success', 'Captura eliminado correctamente.');
        } else {
            return back()->with('error', 'Captura al eliminar el Entrenador.');
        }
    }
}
