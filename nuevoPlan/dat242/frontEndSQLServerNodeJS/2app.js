const express = require('express');
const sql = require('mssql/msnodesqlv8');

const app = express();
const port = 3000;

// Configura la conexión a la base de datos
const dbConfig = {
    server: '.\\SQLEXPRESS',
    database: 'ejemplo2',
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
        const result = await pool.request().query('SELECT * FROM empleado');

        // Crea la tabla HTML
        let html = `
            <h1>Empleados en la base de datos</h1>
            <table border="1">
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
        result.recordset.forEach(empleado => {
            html += `
                <tr>
                    <td>${empleado.ci}</td>
                    <td>${empleado.nombre}</td>
                    <td>${empleado.paterno}</td>
                    <td>${empleado.materno}</td>
                    <td>${empleado.sexo}</td>
                </tr>
            `;
        });

        html += `
                </tbody>
            </table>
        `;

        res.send(html);
    } catch (err) {
        console.error('Error en la consulta', err);
        res.status(500).send('Error en la consulta');
    }
});

// Ruta para obtener las personas en formato JSON
app.get('/empleados', async (req, res) => {
    try {
        const pool = await sql.connect(dbConfig);
        const result = await pool.request().query('SELECT * FROM empleado');
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

