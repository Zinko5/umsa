using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;

class Program
{

    static void funcionParalela()
    {
        Console.WriteLine("Hijo");
    }

    static void Main(string[] args)
    {
        Thread hilo1 = new Thread(new ThreadStart(funcionParalela));
        Thread hilo2 = new Thread(new ThreadStart(funcionParalela));
        Console.WriteLine("Padre");
        hilo1.Start();
        hilo2.Start();
        hilo1.Join();
        hilo2.Join();
    }
}