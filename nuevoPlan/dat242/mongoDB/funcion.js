function mostrarPersonasRevisores(){
    return db.Personas.aggregate([
        {
            $lookup: {
                from: "Revisores",
                localField: "personaid",
                foreignField: "personaid",
                as: "revisor_data"
            }
        },
        {
            $match: {"revisor_data": {$ne: []}}
        },
        {
            $project: {
                "personaid": 1,
                "nacionalidad": 1,
                "fecha_naci": 1,
                "revisor_data.especialidad": 1,
                "revisor_data.telefono": 1
            }
        }
    ]).toArray();
}

// ejecutar:
var resultado = mostrarPersonasRevisores();
printjson(resultado)