using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Guia6
{
    class Producto<T>
    {
        private int costo;
        public int Costo
        {
            get { return costo; }
            set { costo = value; }
        }
        private string nombre;
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private T idProd;
        public T IdProd
        {
            get { return idProd; }
            set { idProd = value; }
        }

        public Producto(int Costo, string Nombre, T IdProd)
        {
            costo = Costo;
            nombre = Nombre;
            idProd = IdProd;
        }
        public void Mostrar()
        {
            System.Console.WriteLine("Mostrando producto: \n" + costo + " " + nombre + " " + idProd);
        }
    }
}