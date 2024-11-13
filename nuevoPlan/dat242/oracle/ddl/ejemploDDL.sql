create table persona(
    idpersona integer not null primary key,
    ci integer not null,
    nombre varchar(26),
    paterno varchar(26),
    materno varchar(26),
    ciudad varchar(26),
    sexo varchar(12),
    fechanacimiento date
);

create table proyecto(
    idproy integer not null primary key,
    descripcion varchar(70)
);

create table estudiante (
    idpersona integer not null primary key,
    idproy integer not null,
    foreign key (idpersona) references persona(idpersona),
    foreign key (idproy) references proyecto(idproy)
)