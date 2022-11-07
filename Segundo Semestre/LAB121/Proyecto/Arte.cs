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
        private string NombredelaObra;
        public string nombredelaObra
        {
            get { return NombredelaObra; }
            set { NombredelaObra = value; }
        }
        public void Leer()
        {
            System.Console.WriteLine("Leer el año de publicacion de la obra: ");
            añodePublicacion = int.Parse(Console.ReadLine());
            System.Console.WriteLine("Leer el nombre de la obra: ");
            NombredelaObra = Console.ReadLine();
        }
        public void Mostrar()
        {
            System.Console.WriteLine(AñodePublicacion + " " + NombredelaObra);
        }
    }
}