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
				System.Console.Write("\n MENU \n ==== \n\n1. CREAR\n2. ADICION\n3. ALISTADO\n4. CONTAR RUTA X\n5. LISTAR CON CONDUCTOR X\n0. SALIR\n\nINTRODUZCA UNA OPCION => ");
				/*Console.WriteLine("\n ");
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
				Console.Write("INTRODUZCA UNA OPCION => ");*/
				ArchiBus archibus = new ArchiBus(@"datos.dat");
				switch( Console.ReadKey().KeyChar ) {
					case '1':
						Console.WriteLine();
						archibus.crear();
						break;
					case '2':
						Console.WriteLine();
						archibus.adicionar();
						break;
					case '3':
						Console.WriteLine();
						archibus.listar();
						break;
					case '4':
						Console.WriteLine();
						archibus.contar();
						break;
					case '5':
						Console.WriteLine();
						archibus.listaralgunos();
						break;
					default:
						Console.WriteLine("\nEl programa ya termino !!!");
						sw = false;
						break;
				}
			}
		}
	}
}
