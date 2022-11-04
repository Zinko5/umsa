using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Proyecto
{
    public class Arte
    {
        private int AñodePublicacion;
        public int añodePublicacion
        {
            get { return AñodePublicacion; }
            set { AñodePublicacion = value; }
        }
        public void Leer()
        {
            System.Console.WriteLine("Leer el año de publicacion de la obra: ");
            añodePublicacion = int.Parse(Console.ReadLine());
        }
        public void Mostrar()
        {
            System.Console.WriteLine(AñodePublicacion);
        }
    }
}