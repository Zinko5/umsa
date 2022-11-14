using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

namespace persistencia
{
	public class ArchiBus
	{
		private string Nombre;
		
		public string nombre {
			get { return Nombre; }
			set { Nombre = value; }
		}
		public ArchiBus(string nombre)
		{
			Nombre = nombre;
		}
		public void crear() {
			if( System.IO.File.Exists(nombre) ) {
				Console.WriteLine("Realmente quiere borrar el archivo?. s/n");
				if( Console.ReadKey().KeyChar == 's' )
					System.IO.File.Delete(Nombre);
				}
				else
					Console.WriteLine("El archivo no existe.");
		}
		public void adicionar() {
			// Abrimos el archivo o se crea un nuevo archivo si no existe
			Stream arch = File.Open(nombre, FileMode.Append);
			BinaryWriter escribe = new BinaryWriter(arch);
			Bus b = new Bus();
			try {
				do {
					Console.WriteLine();
					b.Leer();
					//escritura física en el archivo
					b.Escribir(escribe);
					Console.Write("Desea continuar añadiendo buses? s/n => ");
				} while( Console.ReadKey().KeyChar == 's' );
			}
			catch( Exception ) {
				Console.WriteLine("Fallo en adicionar el objeto !!!");
			}
			finally {
				arch.Close();
			}
		}
		public void listar() {
			// Abrimos el archivo o se crea un nuevo archivo si no existe
			Stream arch = File.Open(nombre, FileMode.OpenOrCreate);
			BinaryReader lee = new BinaryReader(arch);
			Bus b = new Bus();
			try {
				while( true ) {
					//lectura fisica desde el archivo
					b.Lectura(lee);
					b.Mostrar();
				}
			}
			catch( Exception ) {
				Console.WriteLine("Fin de archivo ...");
			}
			finally {
				arch.Close();
			}
		}
		public void contar() {
			Console.WriteLine("Ruta X: ");
			string x = Console.ReadLine();
			Stream arch = File.Open(nombre, FileMode.OpenOrCreate);
			BinaryReader lee = new BinaryReader(arch);
			Bus b = new Bus();
			int c = 0;
			try {
				while( true ) {
					//lectura fisica desde el archivo
					b.Lectura(lee);
					if (b.nomRuta == x) {
						c ++;
					}
				}
			}
			catch( Exception ) {
				Console.WriteLine("Cantidad de buses con ruta " + x + ": " + c);
			}
			finally {
				arch.Close();
			}
		}
		//mostrar el codigo del bus, tipo y anfitrion de los buses del conductor x
		public void listaralgunos() {
			Console.WriteLine("Conductor X: ");
			string x = Console.ReadLine();
			// Abrimos el archivo o se crea un nuevo archivo si no existe
			Stream arch = File.Open(nombre, FileMode.OpenOrCreate);
			BinaryReader lee = new BinaryReader(arch);
			Bus b = new Bus();
			try {
				while( true ) {
					//lectura fisica desde el archivo
					b.Lectura(lee);
					if (b.conductor == x) {
						b.Mostrar();	
					}
				}
			}
			catch( Exception ) {
				Console.WriteLine("Fin de archivo ...");
			}
			finally {
				arch.Close();
			}
		}
	}
}
