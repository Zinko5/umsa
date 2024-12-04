function actualizarmontoarticulo(articuloid, nuevomonto) {
    // Cambiar a la base de datos correcta
    const db = db.getSiblingDB('articulo'); 

    // //Actualizar el monto del artículo
    const resultado = db.Articulo.updateOne(
        { _id: articuloid }, // Busca el artículo por su ID
        { $set: { monto: nuevomonto } } // Actualiza el monto
    );

    // //Registrar el cambio en el historial
    db.historial.insertOne({
        fecha: new Date(),
        articuloid: articuloid,
        nuevomonto: nuevomonto,
        descripcion: 'Se actualizó el monto del artículo: ' + articuloid
    });

    // Retornar un mensaje dependiendo del resultado
    if (resultado.modifiedCount > 0) {
        return 'El monto del artículo ' + articuloid + ' ha sido actualizado a ' + nuevomonto;
    } else {
        return 'No se encontró el artículo con ID: ' + articuloid;
    }
}

actualizarmontoarticulo(1001, 100);

