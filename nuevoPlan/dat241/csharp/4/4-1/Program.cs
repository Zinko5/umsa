using System;
using System.Collections.Generic;
using System.Text;

    class Program
{
    static void Main(String[] args)
    {
        int a, b, c;
        System.Console.WriteLine("Introduza dos números");
        // a = System.Console.ReadLine();
        a = Convert.ToInt32(System.Console.ReadLine());
        b = Convert.ToInt32(System.Console.ReadLine());
        c = a + b;
        System.Console.WriteLine("La suma de los dos números es: " + c.ToString());
        System.Console.ReadKey();
    }
}