using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;

class Program
{

    static void funcionParalela(object objeto)
    {
        string nombre = (string)objeto;
        Console.WriteLine("Hijo " + nombre);
    }

    static void Main(string[] args)
    {
        Thread hilo1 = new Thread(new ParameterizedThreadStart(funcionParalela));
        Thread hilo2 = new Thread(new ParameterizedThreadStart(funcionParalela));
        Console.WriteLine("Padre");
        hilo1.Start("A");
        hilo2.Start("B");
        hilo1.Join();
        hilo2.Join();
    }
}