using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Proyecto
{
    public class Persona
    {
        private int AñoNacimiento;
        public int añoNacimineto
        {
            get { return AñoNacimiento; }
            set { AñoNacimiento = value; }
        }
        private int Ci;
        public int ci
        {
            get { return Ci; }
            set { Ci = value; }
        }
        private string Nacionalidad;
        public string nacionalidad
        {
            get { return Nacionalidad; }
            set { Nacionalidad = value; }
        }
        private int Edad;
        public int edad
        {
            get { return Edad; }
            set { Edad = value; }
        }
        public void Leer()
        {
            System.Console.WriteLine("Leer año de nacimiento: ");
            AñoNacimiento = int.Parse(Console.ReadLine());
            System.Console.WriteLine("Leer  CI: ");
            Ci = int.Parse(Console.ReadLine());
            System.Console.WriteLine("Leer Nacionalidad: ");
            Nacionalidad = Console.ReadLine();
            System.Console.WriteLine("Leer edad");
            Edad = int.Parse(Console.ReadLine());
        }
        public void Mostrar()
        {
            System.Console.WriteLine(AñoNacimiento + " " + Ci + " " + Nacionalidad + " " + Edad);
        }
    }
}