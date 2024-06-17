from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config["MYSQL_HOST"] = "127.0.0.1"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = ""
app.config["MYSQL_DB"] = "PokeMedia"
app.config["MYSQL_CURSORCLASS"] = "DictCursor"

mysql = MySQL(app)

@app.route("/")
def hello():
    return "Hola Mundo"

@app.route('/tabla')
def tabla():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM pokemon")
    datoPokemon = cursor.fetchall()
    cursor.execute("SELECT * FROM Entrenador")
    datosEntrenador = cursor.fetchall()
    cursor.execute("SELECT * FROM Captura")
    datosCaptura = cursor.fetchall()
    cursor.close()
    return render_template("tabla.html", poked=datoPokemon, entrenadores=datosEntrenador, capturas=datosCaptura)

@app.route('/adicionar', methods=['GET', 'POST'])
def adicionarPokemon():
    if request.method == 'POST':
        # Obtener los datos del formulario
        idPokemon = request.form['idPokemon']
        nombre = request.form['nombre']
        tipo = request.form['tipo']
        generacion = request.form['generacion']
        nroPokemon = request.form['nroPokemon']

        # Insertar el nuevo Pokémon en la base de datos
        cursor = mysql.connection.cursor()
        query = "INSERT INTO pokemon (idPokemon, nombre, tipo, generacion, nroPokemon) VALUES (%s, %s, %s, %s, %s)"
        values = (idPokemon, nombre, tipo, generacion, nroPokemon)
        cursor.execute(query, values)
        mysql.connection.commit()
        cursor.close()

        # Redirigir a la página principal después de agregar
        return redirect(url_for('tabla'))

    # Renderizar el formulario para agregar un nuevo Pokémon
    return render_template('adicionarPokemon.html')

@app.route('/actualizar/<int:id>', methods=['GET', 'POST'])
def actualizarPokemon(id):
    try:
        if request.method == 'POST':
            # Obtener los datos del formulario
            nombre = request.form['nombre']
            tipo = request.form['tipo']
            generacion = request.form['generacion']
            nroPokemon = request.form['nroPokemon']

            # Realizar la actualización en la base de datos
            cursor = mysql.connection.cursor()
            query = "UPDATE pokemon SET nombre = %s, tipo = %s, generacion = %s, nroPokemon = %s WHERE idPokemon = %s"
            values = (nombre, tipo, generacion, nroPokemon, id)
            cursor.execute(query, values)
            mysql.connection.commit()
            cursor.close()

            # Redirigir a la página principal después de actualizar
            return redirect(url_for('tabla'))

        # Obtener los datos del Pokémon a actualizar
        cursor = mysql.connection.cursor()
        query = "SELECT * FROM pokemon WHERE idPokemon = %s"
        values = (id,)
        cursor.execute(query, values)
        pokemon = cursor.fetchone()
        cursor.close()

        if pokemon:
            # Renderizar el formulario con los datos precargados
            return render_template('actualizarPokemon.html', pokemon=pokemon)
        else:
            # Manejar el caso en el que no se encuentre un Pokémon con el ID proporcionado
            return "No se encontró un Pokémon con el ID proporcionado"
    except Exception as e:
        # Capturar y mostrar cualquier excepción que pueda ocurrir
        return str(e)
    
@app.route('/eliminar/<int:id>', methods=['POST'])
def eliminarPokemon(id):
    try:
        # Eliminar el Pokémon de la base de datos
        cursor = mysql.connection.cursor()
        query = "DELETE FROM pokemon WHERE idPokemon = %s"
        values = (id,)
        cursor.execute(query, values)
        mysql.connection.commit()
        cursor.close()

        # Redirigir a la página principal después de eliminar
        return redirect(url_for('tabla'))
    except Exception as e:
        # Capturar y mostrar cualquier excepción que pueda ocurrir
        return str(e)
    
# ... (código anterior)

@app.route('/adicionarEntrenador', methods=['GET', 'POST'])
def adicionarEntrenador():
    if request.method == 'POST':
        # Obtener los datos del formulario
        ci = request.form['ci']
        nombre = request.form['nombre']
        paterno = request.form['paterno']
        region = request.form['region']
        edad = request.form['edad']
        sexo = request.form['sexo']

        # Insertar el nuevo Entrenador en la base de datos
        cursor = mysql.connection.cursor()
        query = "INSERT INTO Entrenador (ci, nombre, paterno, region, edad, sexo) VALUES (%s, %s, %s, %s, %s, %s)"
        values = (ci, nombre, paterno, region, edad, sexo)
        cursor.execute(query, values)
        mysql.connection.commit()
        cursor.close()

        # Redirigir a la página principal después de agregar
        return redirect(url_for('tabla'))

    # Renderizar el formulario para agregar un nuevo Entrenador
    return render_template('adicionarEntrenador.html')

@app.route('/actualizarEntrenador/<ci>', methods=['GET', 'POST'])
def actualizarEntrenador(ci):
    try:
        if request.method == 'POST':
            # Obtener los datos del formulario
            nombre = request.form['nombre']
            paterno = request.form['paterno']
            region = request.form['region']
            edad = request.form['edad']
            sexo = request.form['sexo']

            # Realizar la actualización en la base de datos
            cursor = mysql.connection.cursor()
            query = "UPDATE Entrenador SET nombre = %s, paterno = %s, region = %s, edad = %s, sexo = %s WHERE ci = %s"
            values = (nombre, paterno, region, edad, sexo, ci)
            cursor.execute(query, values)
            mysql.connection.commit()
            cursor.close()

            # Redirigir a la página principal después de actualizar
            return redirect(url_for('tabla'))

        # Obtener los datos del Entrenador a actualizar
        cursor = mysql.connection.cursor()
        query = "SELECT * FROM Entrenador WHERE ci = %s"
        values = (ci,)
        cursor.execute(query, values)
        entrenador = cursor.fetchone()
        cursor.close()

        if entrenador:
            # Renderizar el formulario con los datos precargados
            return render_template('actualizarEntrenador.html', entrenador=entrenador)
        else:
            # Manejar el caso en el que no se encuentre un Entrenador con el CI proporcionado
            return "No se encontró un Entrenador con el CI proporcionado"
    except Exception as e:
        # Capturar y mostrar cualquier excepción que pueda ocurrir
        return str(e)

@app.route('/eliminarEntrenador/<ci>', methods=['POST'])
def eliminarEntrenador(ci):
    try:
        # Eliminar el Entrenador de la base de datos
        cursor = mysql.connection.cursor()
        query = "DELETE FROM Entrenador WHERE ci = %s"
        values = (ci,)
        cursor.execute(query, values)
        mysql.connection.commit()
        cursor.close()

        # Redirigir a la página principal después de eliminar
        return redirect(url_for('tabla'))
    except Exception as e:
        # Capturar y mostrar cualquier excepción que pueda ocurrir
        return str(e)
    
@app.route('/adicionarCaptura', methods=['GET', 'POST'])
def adicionarCaptura():
    if request.method == 'POST':
        # Obtener los datos del formulario
        idPokemon = request.form['idPokemon']
        ci = request.form['ci']
        ruta = request.form['ruta']

        # Insertar la nueva Captura en la base de datos
        cursor = mysql.connection.cursor()
        query = "INSERT INTO Captura (idPokemon, ci, ruta) VALUES (%s, %s, %s)"
        values = (idPokemon, ci, ruta)
        cursor.execute(query, values)
        mysql.connection.commit()
        cursor.close()

        # Redirigir a la página principal después de agregar
        return redirect(url_for('tabla'))

    # Renderizar el formulario para agregar una nueva Captura
    return render_template('adicionarCaptura.html')

@app.route('/actualizarCaptura/<idPokemon>/<ci>', methods=['GET', 'POST'])
def actualizarCaptura(idPokemon, ci):
    try:
        if request.method == 'POST':
            # Obtener los datos del formulario
            nuevoCi = request.form['ci']
            nuevaRuta = request.form['ruta']

            # Realizar la actualización en la base de datos
            cursor = mysql.connection.cursor()
            query = "UPDATE Captura SET ci = %s, ruta = %s WHERE idPokemon = %s AND ci = %s"
            values = (nuevoCi, nuevaRuta, idPokemon, ci)
            cursor.execute(query, values)
            mysql.connection.commit()
            cursor.close()

            # Redirigir a la página principal después de actualizar
            return redirect(url_for('tabla'))

        # Obtener los datos de la Captura a actualizar
        cursor = mysql.connection.cursor()
        query = "SELECT * FROM Captura WHERE idPokemon = %s AND ci = %s"
        values = (idPokemon, ci)
        cursor.execute(query, values)
        captura = cursor.fetchone()
        cursor.close()

        if captura:
            # Renderizar el formulario con los datos precargados
            return render_template('actualizarCaptura.html', captura=captura)
        else:
            # Manejar el caso en el que no se encuentre una Captura con los IDs proporcionados
            return "No se encontró una Captura con los IDs proporcionados"
    except Exception as e:
        # Capturar y mostrar cualquier excepción que pueda ocurrir
        return str(e)

@app.route('/eliminarCaptura/<idPokemon>/<ci>', methods=['POST'])
def eliminarCaptura(idPokemon, ci):
    try:
        # Eliminar la Captura de la base de datos
        cursor = mysql.connection.cursor()
        query = "DELETE FROM Captura WHERE idPokemon = %s AND ci = %s"
        values = (idPokemon, ci)
        cursor.execute(query, values)
        mysql.connection.commit()
        cursor.close()

        # Redirigir a la página principal después de eliminar
        return redirect(url_for('tabla'))
    except Exception as e:
        # Capturar y mostrar cualquier excepción que pueda ocurrir
        return str(e)