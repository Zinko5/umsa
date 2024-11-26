const cursor = db.Personas.find()
    .limit(5)
    .sort({ nombre: 1 });
print('Ejecutando cursor:')
cursor.forEach(function(doc) {
  print('Nombre: ', doc.nombre, '| Genero: ', doc.genero);
});
