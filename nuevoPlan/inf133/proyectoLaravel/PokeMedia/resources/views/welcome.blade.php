<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <div class="container-sm">
        <br><br>
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <span class="navbar-brand" href="#">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/5/53/Pok%C3%A9_Ball_icon.svg" alt="Logo"
                        width="70.5" height="56.4" class="d-inline-block align-text-center">
                    <span class="fs-2">PokeMedia en Laravel</span>
                </span>
            </div>
        </nav>
        <h2>Pokemon</h2>
        <table class="table">
            <thead class="table-dark">
                <tr>
                    <td>ID</td>
                    <td>Nombre</td>
                    <td>Tipo</td>
                    <td>Generacion</td>
                    <td>Numero</td>
                    <td>Opcion</td>
                </tr>
            </thead>

            <tbody>
                @foreach ($pokemon as $datoPokemon)
                    <tr>
                        <!--aqui hay que colocar exactamente el nombre de la columna de la base de datos -->
                        <td>{{$datoPokemon->idPokemon}}</td>
                        <td>{{$datoPokemon->nombre}}</td>
                        <td>{{$datoPokemon->tipo}}</td>
                        <td>{{$datoPokemon->generacion}}</td>
                        <td>{{$datoPokemon->nroPokemon}}</td>
                        <td>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#actualizarPokemon{{ $datoPokemon->idPokemon }}">
                                Actualizar
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#eliminarPokemon{{ $datoPokemon->idPokemon }}">
                                Eliminar
                            </button>
                        </td>

                    </tr>
                @endforeach
            </tbody>
        </table>

        <!-- Boton Adicionar Pokemon -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#adicionarPokemon">
            Adicionar Pokemon
        </button>

        <!-- Modal Adicionar Pokemon -->
        <div class="modal fade" id="adicionarPokemon" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Adicionar</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="{{route("pokemon.adicionar")}}">
                        @csrf
                        <div class="modal-body">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">ID</span>
                                <input type="text" class="form-control" placeholder="ID" aria-label="ID"
                                    aria-describedby="addon-wrapping" name="id" id="id">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Nombre</span>
                                <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre"
                                    aria-describedby="addon-wrapping" name="nombre" id="nombre">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Tipo</span>
                                <input type="text" class="form-control" placeholder="Tipo" aria-label="Tipo"
                                    aria-describedby="addon-wrapping" name="tipo" id="tipo">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Generacion</span>
                                <input type="text" class="form-control" placeholder="Generacion" aria-label="Generacion"
                                    aria-describedby="addon-wrapping" name="generacion" id="generacion">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Numero</span>
                                <input type="text" class="form-control" placeholder="Numero" aria-label="Numero"
                                    aria-describedby="addon-wrapping" name="numero" id="numero">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-secondary" data-bs-dismiss="modal" name="Cerrar"
                                value="Cerrar">
                            <input type="submit" class="btn btn-primary" name="Guardar" value="Guardar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        @foreach ($pokemon as $datoPokemon)
            <!-- Modal para Editar Pokemon -->
            <div class="modal fade" id="actualizarPokemon{{ $datoPokemon->idPokemon }}" tabindex="-1"
                aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Editar Pokémon</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST" action="{{ route('pokemon.actualizar', $datoPokemon->idPokemon) }}">
                            @csrf
                            @method('PUT')
                            <div class="modal-body">
                                <!-- Campos de entrada para editar los datos -->
                                <input type="hidden" name="id" value="{{ $datoPokemon->idPokemon }}">
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre"
                                        value="{{ $datoPokemon->nombre }}">
                                </div>
                                <div class="mb-3">
                                    <label for="tipo" class="form-label">Tipo</label>
                                    <input type="text" class="form-control" id="tipo" name="tipo"
                                        value="{{ $datoPokemon->tipo }}">
                                </div>
                                <div class="mb-3">
                                    <label for="generacion" class="form-label">Generación</label>
                                    <input type="text" class="form-control" id="generacion" name="generacion"
                                        value="{{ $datoPokemon->generacion }}">
                                </div>
                                <div class="mb-3">
                                    <label for="numero" class="form-label">Numero</label>
                                    <input type="text" class="form-control" id="numero" name="numero"
                                        value="{{ $datoPokemon->nroPokemon }}">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Guardar cambios</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            @foreach ($pokemon as $datoPokemon)
                <!-- Modal para Eliminar Pokemon -->
                <div class="modal fade" id="eliminarPokemon{{ $datoPokemon->idPokemon }}" tabindex="-1"
                    aria-labelledby="deleteModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel">Confirmar eliminación</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ¿Estás seguro de que deseas eliminar el Pokémon {{ $datoPokemon->nombre }}?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <form method="GET" action="{{ route('pokemon.eliminar', $datoPokemon->idPokemon) }}">
                                    @csrf
                                    <button type="submit" class="btn btn-danger">Eliminar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        @endforeach
        <br><br>
        <h2>Entrenadores</h2>
        <table class="table">
            <thead class="table-dark">
                <tr>
                    <td>CI</td>
                    <td>Nombre</td>
                    <td>Paterno</td>
                    <td>Region</td>
                    <td>Edad</td>
                    <td>Sexo</td>
                    <td>Opcion</td>
                </tr>
            </thead>

            <tbody>
                @foreach ($entrenador as $datoEntrenador)
                    <tr>
                        <!--aqui hay que colocar exactamente el nombre de la columna de la base de datos -->
                        <td>{{$datoEntrenador->ci}}</td>
                        <td>{{$datoEntrenador->nombre}}</td>
                        <td>{{$datoEntrenador->paterno}}</td>
                        <td>{{$datoEntrenador->region}}</td>
                        <td>{{$datoEntrenador->edad}}</td>
                        <td>{{$datoEntrenador->sexo}}</td>
                        <td>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#actualizarEntrenador{{ $datoEntrenador->ci }}">
                                Actualizar
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#eliminarEntrenador{{ $datoEntrenador->ci }}">
                                Eliminar
                            </button>
                        </td>

                    </tr>
                @endforeach
            </tbody>
        </table>

        <!-- Boton Adicionar Entrenador -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#adicionarEntrenador">
            Adicionar Entrenador
        </button>

        <!-- Modal Adicionar Entrenador -->
        <div class="modal fade" id="adicionarEntrenador" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Adicionar</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="{{route("entrenador.adicionar")}}">
                        @csrf
                        <div class="modal-body">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">CI</span>
                                <input type="text" class="form-control" placeholder="CI" aria-label="CI"
                                    aria-describedby="addon-wrapping" name="ci" id="ci">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Nombre</span>
                                <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre"
                                    aria-describedby="addon-wrapping" name="nombre" id="nombre">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Paterno</span>
                                <input type="text" class="form-control" placeholder="Paterno" aria-label="Paterno"
                                    aria-describedby="addon-wrapping" name="paterno" id="paterno">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Region</span>
                                <input type="text" class="form-control" placeholder="Region" aria-label="Region"
                                    aria-describedby="addon-wrapping" name="region" id="region">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Edad</span>
                                <input type="text" class="form-control" placeholder="Edad" aria-label="Edad"
                                    aria-describedby="addon-wrapping" name="edad" id="edad">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Sexo</span>
                                <input type="text" class="form-control" placeholder="Sexo" aria-label="Sexo"
                                    aria-describedby="addon-wrapping" name="sexo" id="sexo">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-secondary" data-bs-dismiss="modal" name="Cerrar"
                                value="Cerrar">
                            <input type="submit" class="btn btn-primary" name="Guardar" value="Guardar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        @foreach ($entrenador as $datoEntrenador)
            <!-- Modal para Editar Entrenador -->
            <div class="modal fade" id="actualizarEntrenador{{ $datoEntrenador->ci }}" tabindex="-1"
                aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Editar Entrenador</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST" action="{{ route('entrenador.actualizar', $datoEntrenador->ci) }}">
                            @csrf
                            @method('PUT')
                            <div class="modal-body">
                                <!-- Campos de entrada para editar los datos -->
                                <input type="hidden" name="id" value="{{ $datoEntrenador->ci }}">
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre"
                                        value="{{ $datoEntrenador->nombre }}">
                                </div>
                                <div class="mb-3">
                                    <label for="paterno" class="form-label">Paterno</label>
                                    <input type="text" class="form-control" id="paterno" name="paterno"
                                        value="{{ $datoEntrenador->paterno }}">
                                </div>
                                <div class="mb-3">
                                    <label for="region" class="form-label">Region</label>
                                    <input type="text" class="form-control" id="region" name="region"
                                        value="{{ $datoEntrenador->region }}">
                                </div>
                                <div class="mb-3">
                                    <label for="edad" class="form-label">Edad</label>
                                    <input type="text" class="form-control" id="edad" name="edad"
                                        value="{{ $datoEntrenador->edad }}">
                                </div>
                                <div class="mb-3">
                                    <label for="sexo" class="form-label">Sexo</label>
                                    <input type="text" class="form-control" id="sexo" name="sexo"
                                        value="{{ $datoEntrenador->sexo }}">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Guardar cambios</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            @foreach ($entrenador as $datoEntrenador)
                <!-- Modal para Eliminar Entrenador -->
                <div class="modal fade" id="eliminarEntrenador{{ $datoEntrenador->ci }}" tabindex="-1"
                    aria-labelledby="deleteModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel">Confirmar eliminación</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ¿Estás seguro de que deseas eliminar el Entrenador {{ $datoEntrenador->nombre }}?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <form method="GET" action="{{ route('entrenador.eliminar', $datoEntrenador->ci) }}">
                                    @csrf
                                    <button type="submit" class="btn btn-danger">Eliminar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        @endforeach

        <br><br>
        <h2>Capturas</h2>
        <table class="table">
            <thead class="table-dark">
                <tr>
                    <td>IDPokemon</td>
                    <td>CI</td>
                    <td>Ruta</td>
                    <td>Opcion</td>
                </tr>
            </thead>

            <tbody>
                @foreach ($captura as $datoCaptura)
                    <tr>
                        <!--aqui hay que colocar exactamente el nombre de la columna de la base de datos -->
                        <td>{{$datoCaptura->idPokemon}}</td>
                        <td>{{$datoCaptura->ci}}</td>
                        <td>{{$datoCaptura->ruta}}</td>
                        <td>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#actualizarCaptura{{ $datoCaptura->idPokemon }}">
                                Actualizar
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#eliminarCaptura{{ $datoCaptura->idPokemon }}">
                                Eliminar
                            </button>
                        </td>

                    </tr>
                @endforeach
            </tbody>
        </table>

        <!-- Boton Adicionar Captura -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#adicionarCaptura">
            Adicionar Captura
        </button>

        <!-- Modal Adicionar Captura -->
        <div class="modal fade" id="adicionarCaptura" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Adicionar</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="{{route("captura.adicionar")}}">
                        @csrf
                        <div class="modal-body">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">IDPokemon</span>
                                <input type="text" class="form-control" placeholder="IDPokemon" aria-label="IDPokemon"
                                    aria-describedby="addon-wrapping" name="idPokemon" id="idPokemon">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">CI</span>
                                <input type="text" class="form-control" placeholder="CI" aria-label="CI"
                                    aria-describedby="addon-wrapping" name="ci" id="ci">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">Ruta</span>
                                <input type="text" class="form-control" placeholder="Ruta" aria-label="Ruta"
                                    aria-describedby="addon-wrapping" name="ruta" id="ruta">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-secondary" data-bs-dismiss="modal" name="Cerrar"
                                value="Cerrar">
                            <input type="submit" class="btn btn-primary" name="Guardar" value="Guardar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        @foreach ($captura as $datoCaptura)
            <!-- Modal para Editar Captura -->
            <div class="modal fade" id="actualizarCaptura{{ $datoCaptura->idPokemon }}" tabindex="-1"
                aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Editar Captura</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST" action="{{ route('captura.actualizar', $datoCaptura->idPokemon) }}">
                            @csrf
                            @method('PUT')
                            <div class="modal-body">
                                <!-- Campos de entrada para editar los datos -->
                                <input type="hidden" name="id" value="{{ $datoCaptura->idPokemon }}">
                                <div class="mb-3">
                                    <label for="idPokemon" class="form-label">IDPokemon</label>
                                    <input type="text" class="form-control" id="idPokemon" name="idPokemon"
                                        value="{{ $datoCaptura->idPokemon }}">
                                </div>
                                <div class="mb-3">
                                    <label for="ci" class="form-label">CI</label>
                                    <input type="text" class="form-control" id="ci" name="ci"
                                        value="{{ $datoCaptura->ci }}">
                                </div>
                                <div class="mb-3">
                                    <label for="ruta" class="form-label">Ruta</label>
                                    <input type="text" class="form-control" id="ruta" name="ruta"
                                        value="{{ $datoCaptura->ruta }}">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Guardar cambios</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            @foreach ($captura as $datoCaptura)
                <!-- Modal para Eliminar Captura -->
                <div class="modal fade" id="eliminarCaptura{{ $datoCaptura->idPokemon }}" tabindex="-1"
                    aria-labelledby="deleteModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel">Confirmar eliminación</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ¿Estás seguro de que deseas eliminar la Captura {{ $datoCaptura->idPokemon }}?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <form method="GET" action="{{ route('pokemon.eliminar', $datoCaptura->idPokemon) }}">
                                    @csrf
                                    <button type="submit" class="btn btn-danger">Eliminar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        @endforeach

    </div>
    <br><br>
</body>

</html>