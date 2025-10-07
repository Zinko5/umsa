using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;

class Program {
    static void funcionParalela(object objeto)
    {
        string nombre = (string)objeto;
        Console.WriteLine("Hijo " + nombre);
        for (int i = 0; i <= 10; i++)
        {
            System.Console.WriteLine("Hijo " + nombre + " contador " + i);
        }
    }
    static void Main(string [] args) {
        Thread hilo1 = new Thread(new ParameterizedThreadStart(funcionParalela));
        Thread hilo2 = new Thread(new ParameterizedThreadStart(funcionParalela));
        Console.WriteLine("Padre");
        hilo1.Start("A");
        hilo2.Start("B");
        for (int i = 0; i < 10; i++)
        {
            System.Console.WriteLine("Padre contador " + i);
            Thread.Sleep(2);
        }
        hilo1.Join();
        hilo2.Join();
    }
}