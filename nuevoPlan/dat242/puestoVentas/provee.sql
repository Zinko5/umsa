create table provee (
    productoId Integer not null primary key,
    provId Integer not null primary key,
    cantidad Integer not null primary key,
    fechaIngreso date,
    foreign key (productoId) references producto(productoId),
    foreign key (provId) references proveedor(provId)a
)