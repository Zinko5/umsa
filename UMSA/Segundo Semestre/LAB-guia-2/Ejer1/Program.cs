namespace Ejer1;
class Program
{
    static void Main(string[] args)
    {
        double y;
        HeadPhone HP = new HeadPhone();
        HeadPhone HP1 = new HeadPhone(80.99, "Logitech", "Azul");
        HP --;
        HP1--;
        HP ++;
        HP --;
        y = double.Parse(Console.ReadLine());
        HP = HP + y;
        HP --;
    }
}