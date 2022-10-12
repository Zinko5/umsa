namespace ejer2;
class Program
{
    static void Main(string[] args)
    {
        SuperMercado s1 = new SuperMercado();
        SuperMercado s2 = new SuperMercado("Fidalga");
        s1.mostrar();
        s2.mostrar();
        s1.masstock("mochila",s2);
        s1.masbaratos(s2);
        s1.disponible("jabon");
    }
}
