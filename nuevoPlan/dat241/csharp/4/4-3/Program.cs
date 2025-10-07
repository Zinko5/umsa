using System;
using System.Collections.Generic;
using System.Text;

class Program
{

    static unsafe void suma(int a, int b, int* c)
    {
        *c = a + b;
    }

    static unsafe void Main(string[] args)
    {
        int a, b, c;
        System.Console.WriteLine("Introduza dos números");
        a = Convert.ToInt32(System.Console.ReadLine());
        b = Convert.ToInt32(System.Console.ReadLine());
        suma(a, b, &c);
        System.Console.WriteLine("La suma de los dos números es: " + c.ToString());
        System.Console.ReadKey();
    }
}