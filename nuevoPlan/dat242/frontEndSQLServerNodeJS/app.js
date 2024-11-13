const express = require('express');
const sql = require('mssql/msnodesqlv8');

const app = express();
const port = 3000;

// Servir archivos estáticos desde el directorio actual
app.use(express.static(__dirname));

// Configura la conexión a la base de datos
const dbConfig = {
    server: '.\\SQLEXPRESS',
    database: 'ejemplo1',
    options: {
        trustServerCertificate: true,
        encrypt: false,
        trustedConnection: true,  // Esta opción permite la autenticación de Windows
    },
    driver: 'msnodesqlv8',
};

// Ruta para la página principal
app.get('/', async (req, res) => {
    try {
        const pool = await sql.connect(dbConfig);
        const result = await pool.request().query('SELECT * FROM persona');

        // Crea la tabla HTML con el enlace al archivo CSS
        let html = `
            <!DOCTYPE html>
            <html lang="es">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Personas</title>
                <link rel="stylesheet" href="/style.css">
            </head>
            <body>
                <h1>Personas en la base de datos</h1>
                <table>
                    <thead>
                        <tr>
                            <th>CI</th>
                            <th>Nombre</th>
                            <th>Paterno</th>
                            <th>Materno</th>
                            <th>Sexo</th>
                        </tr>
                    </thead>
                    <tbody>
        `;

        // Agrega filas a la tabla
        result.recordset.forEach(persona => {
            html += `
                <tr>
                    <td>${persona.ci}</td>
                    <td>${persona.nombre}</td>
                    <td>${persona.paterno}</td>
                    <td>${persona.materno}</td>
                    <td>${persona.sexo}</td>
                </tr>
            `;
        });

        html += `
                </tbody>
            </table>
            </body>
            </html>
        `;

        res.send(html);
    } catch (err) {
        console.error('Error en la consulta', err);
        res.status(500).send('Error en la consulta');
    }
});

// Ruta para obtener las personas en formato JSON
app.get('/personas', async (req, res) => {
    try {
        const pool = await sql.connect(dbConfig);
        const result = await pool.request().query('SELECT * FROM persona');
        res.json(result.recordset);
    } catch (err) {
        console.error('Error en la consulta', err);
        res.status(500).send('Error en la consulta');
    }
});

// Inicia el servidor
app.listen(port, () => {
    console.log(`Servidor escuchando en http://localhost:${port}`);
});
