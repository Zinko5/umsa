namespace ejer3;
class Program
{
    static void Main(string[] args)
    {
        Conductor c1 = new Conductor();
        Conductor c2 = new Conductor("Pedro");
        Vehiculo v1 = new Vehiculo();
        Vehiculo v2 = new Vehiculo("camioneta");
        Vehiculo v3 = new Vehiculo("KFYH8948", 2705.7);
        c1.vehiculosdeci(v1,v2,v3);
        v2.conductordeplaca(c1,c2);
        c2.citipo(v1,v2,v3);
    }
}
