create table persona(
    idpersona integer not null enable,
    ci integer not null enable,
    nombre varchar(26),
    paterno varchar(26),
    materno varchar(26),
    ciudad varchar(26),
    sexo varchar(12),
    fechanacimiento date,
    constraint personapk primary key(idpersona) enable 
);

create table proyecto(
    idproy integer not null enable,
    descripcion varchar(70),
    constraint proypk primary key(idproy) enable
);

create table estudiante (
    idpersona integer not null enable,
    idproy integer,
    constraint estudiantepk primary key(idpersona) enable,
    constraint estudianteperfk foreign key (idpersona) references persona(idpersona),
    constraint estudianteproyfk foreign key (idproy) references proyecto(idproy),
);

-- modelo er y relacional
-- scrip ddl
-- orable exportado