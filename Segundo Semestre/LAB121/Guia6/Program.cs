using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Guia6;
class Program
{
    static void Main(string[] args)
    {
        Producto<string> P = new Producto<string>(50, "Dove", "Jabon-123");
        P.Mostrar();
        Producto<int> P1 = new Producto<int>(46, "Zote", 123456);
        P1.Mostrar();
    }
}
