using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

namespace persistencia
{
	class Program
	{
		
		static void Main( string[] args ) {
			bool sw = true;
			while( sw ) {
				Console.WriteLine("\n ");
				Console.WriteLine(" MENU ");
				Console.WriteLine(" ==== ");
				Console.WriteLine(" ");
				Console.WriteLine("1. CREAR ");
				Console.WriteLine("2. ADICION ");
				Console.WriteLine("3. LISTADO ");
				Console.WriteLine("4. CONTAR RUTA X");
				Console.WriteLine("5. LISTAR CON CONDUCTOR X");
				Console.WriteLine("0. SALIR ");
				Console.WriteLine(" ");
				Console.Write("INTRODUZCA UNA OPCION => ");
				ArchiBus bus = new ArchiBus(@"/home/gabriel/Público/datos.txt");
				switch( Console.ReadKey().KeyChar ) {
					case '1':
						Console.WriteLine();
						bus.crear();
						break;
					case '2':
						Console.WriteLine();
						bus.adicionar();
						break;
					case '3':
						Console.WriteLine();
						bus.listar();
						break;
					case '4':
						Console.WriteLine();
						bus.contar();
						break;
					case '5':
						Console.WriteLine();
						bus.listaralgunos();
						break;
					default:
						Console.WriteLine("\n El programa ya termino !!!");
						sw = false;
						break;
				}
			}
		}
	}
}
