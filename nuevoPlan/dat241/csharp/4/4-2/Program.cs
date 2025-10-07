using System;
using System.Collections.Generic;
using System.Text;

class Program
{

    static int suma(int a, int b)
    {
        return a + b;
    }

    static void Main(String[] args)
    {
        int a, b, c;
        System.Console.WriteLine("Introduza dos números");
        // a = System.Console.ReadLine();
        a = Convert.ToInt32(System.Console.ReadLine());
        b = Convert.ToInt32(System.Console.ReadLine());
        System.Console.WriteLine("La suma de los dos números es: " + suma(a, b).ToString());
        System.Console.ReadKey();
    }
}