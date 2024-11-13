create procedure fichaEmpleado
  @xidEmpleado int,
  @xmesNacimiento int output ,
  @xnombre varchar(50) output
as
begin
    select @xnombre = nombre
      from empleado
     where @xidEmpleado = idEmpleado;

  select @xmesNacimiento = month(fecha_nacimiento)
    from empleado
    where @xidEmpleado = idEmpleado;
end;
go

declare @xidEmpleado int = 1001;
declare @xmesNacimiento int;
declare @xnombre varchar(50);
exec fichaEmpleado @xidEmpleado, @xmesNacimiento output, @xnombre output;
print 'Ficha empleado:';
print 'Nombre: ' + @xnombre;
print 'Mes de nacimiento: ' + cast(@xmesNacimiento as varchar);