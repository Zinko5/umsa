using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Proyecto
{
    public class Comida:Cultura
    {
        private int nroIngredientes;
        public int NroIngredientes
        {
            get { return nroIngredientes; }
            set { nroIngredientes = value; }
        }
        private string []Ingredientes = new string[50];
        public void Leer()
        {
            System.Console.WriteLine("Leer numero de partes: ");
            nroIngredientes = int.Parse(Console.ReadLine());
            for (int i = 0; i < nroIngredientes; i++)
            {
                System.Console.WriteLine("Leer parte de la vestimenta: ");
                Ingredientes[i] = Console.ReadLine();
            }
        }
        public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(nroIngredientes);
            for (int i = 0; i < nroIngredientes; i++)
            {
                System.Console.WriteLine(Ingredientes[i]);
            }
        }
    }
}