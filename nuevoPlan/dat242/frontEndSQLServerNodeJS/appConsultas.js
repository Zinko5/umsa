const express = require('express');
const sql = require('mssql/msnodesqlv8');
const bodyParser = require('body-parser');

const app = express();
const port = 55555;

// Configura la conexión a la base de datos
const dbConfig = {
    server: '.\\SQLEXPRESS',
    database: 'ejemplo1',
    options: {
        trustServerCertificate: true,
        encrypt: false,
        trustedConnection: true, // Esta opción permite la autenticación de Windows
    },
    driver: 'msnodesqlv8',
};

// Middleware para analizar el cuerpo de la solicitud
app.use(bodyParser.json());
app.use(express.static(__dirname));

// Ruta para la página principal
app.get('/', (req, res) => {
    const html = `
        <!DOCTYPE html>
        <html lang="es">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Ejecutar Consulta SQL</title>
            <link rel="stylesheet" href="/style.css">
        </head>
        <body>
            <h1>Ejecutar Consulta SQL</h1>
            <form id="consultaForm">
                <label for="query">Escribe tu consulta SQL:</label><br>
                <textarea id="query" name="query" rows="4" cols="50"></textarea><br>
                <button type="submit">Ejecutar</button>
            </form>
            <div id="result"></div>
            
            <script>
                document.getElementById('consultaForm').addEventListener('submit', async function (e) {
                    e.preventDefault(); // Evita que el formulario se envíe de manera tradicional
                    const query = document.getElementById('query').value;

                    // Realiza la solicitud AJAX
                    const response = await fetch('/consulta', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({ query }),
                    });

                    // Muestra los resultados
                    const resultDiv = document.getElementById('result');
                    if (response.ok) {
                        const data = await response.text();
                        resultDiv.innerHTML = data;
                    } else {
                        resultDiv.innerHTML = 'Error en la consulta';
                    }
                });
            </script>
        </body>
        </html>
    `;
    res.send(html);
});

// Ruta POST para ejecutar la consulta
app.post('/consulta', async (req, res) => {
    const query = req.body.query; // Obtener la consulta del cuerpo de la solicitud

    try {
        const pool = await sql.connect(dbConfig);
        let outputMessages = '';

        const request = pool.request();

        // Capturar mensajes de SQL Server (como PRINT)
        request.on('info', (info) => {
            // Agregar un salto de línea entre los mensajes
            outputMessages += info.message + '<br>';
        });

        const result = await request.query(query);

        let responseMessage = '';

        // Verifica si la consulta tiene un conjunto de resultados
        if (result.recordset) {
            // Crear la tabla HTML para mostrar los resultados
            responseMessage = `
                <h2>Resultado de la consulta:</h2>
                <table border="1">
                    <thead>
                        <tr>
            `;

            // Agregar encabezados de columna
            if (result.recordset.length > 0) {
                Object.keys(result.recordset[0]).forEach(column => {
                    responseMessage += `<th>${column}</th>`;
                });
                responseMessage += `</tr></thead><tbody>`;

                // Agregar filas de datos
                result.recordset.forEach(row => {
                    responseMessage += `<tr>`;
                    Object.values(row).forEach(value => {
                        responseMessage += `<td>${value}</td>`;
                    });
                    responseMessage += `</tr>`;
                });

                responseMessage += `</tbody></table>`;
            } else {
                responseMessage += `<p>No se encontraron resultados.</p>`;
            }
        } else {
            // Si no hay recordset, significa que la consulta fue una sentencia no de selección
            responseMessage = `<p>Consulta ejecutada correctamente.</p>`;
        }

        // Agregar mensajes de salida, como PRINT
        if (outputMessages) {
            responseMessage += `<p>${outputMessages}</p>`;
        }

        res.send(responseMessage);
    } catch (err) {
        console.error('Error en la consulta', err);
        res.status(500).send(`Error en la consulta: ${err.message}`);
    }
});

// Inicia el servidor
app.listen(port, () => {
    console.log(`Servidor escuchando en http://localhost:${port}`);
});
