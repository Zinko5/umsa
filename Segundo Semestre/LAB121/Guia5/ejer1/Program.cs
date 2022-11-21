using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

namespace ejer1;
class Program
{
    static void Main(string[] args)
    {
        bool sw = true;
			while( sw ) {
				Console.WriteLine("\n ");
				Console.WriteLine(" MENU ");
				Console.WriteLine(" ==== ");
				Console.WriteLine(" ");
				Console.WriteLine("1. CREAR ");
				Console.WriteLine("2. ADICION ");
				Console.WriteLine("3. LISTADO ");
                System.Console.WriteLine("4. ELIMINAR MATRICULA");
				Console.WriteLine("0. SALIR ");
				Console.WriteLine(" ");
				Console.Write("INTRODUZCA UNA OPCION => ");
				ArchAvion archivo = new ArchAvion(@"datos.txt");
				switch( Console.ReadKey().KeyChar ) {
					case '1':
						Console.WriteLine();
						archivo.crear();
						break;
					case '2':
						Console.WriteLine();
						archivo.adicionar();
						break;
					case '3':
						Console.WriteLine();
						archivo.listar();
						break;
                    case '4':
                        System.Console.WriteLine();
                        archivo.Eliminar();
                        break;
					default:
						Console.WriteLine("\n El programa ya termino !!!");
						sw = false;
						break;
				}
			}
    }
}
