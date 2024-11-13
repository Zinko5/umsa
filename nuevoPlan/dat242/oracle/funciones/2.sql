create or replace function f1(
  xci in integer
) return varchar2
is
resp varchar2(50);
begin
  select colores
    into resp
    from frente f
    join candidato c on c.idfrente = f.idfrente
    where c.ci = xci
    return resp;
end f1;