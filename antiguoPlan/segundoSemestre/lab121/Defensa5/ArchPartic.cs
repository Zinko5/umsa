using System.IO;
using System;
using System.Linq;
using System.Text;
using System.Collections.Generic;

namespace defensa5
{

	public class ArchPartic
	{
		string nomP;
		
		public string NomP {
			get { return nomP; }
			set { nomP = value; }
		}
		public ArchPartic(string n)
		{
			nomP = n;
		}
		public void crear()
        {
			Console.WriteLine("\n");
            if (System.IO.File.Exists( nomP ))
            {
                Console.WriteLine("Realmente quiere borrar el archivo?. s/n");
                if (Console.ReadKey().KeyChar == 's')
                    System.IO.File.Delete(nomP);
            }
            else
                Console.WriteLine("El archivo no existe.");
        }
        public void adicionar()
        {
        	Console.WriteLine();
            // Abrimos el archivo o se crea un nuevo archivo si no existe
            Stream arch = File.Open(nomP, FileMode.Append);
            BinaryWriter escribe = new BinaryWriter(arch);
            Participante p = new Participante();
            try
            {
                do
                {
                	Console.WriteLine();
                    p.leer();
                    //escritura física en el archivo
                    p.escribir(escribe);
                    Console.Write("Desea continuar añadiendo registros? s/n => ");
                } while (Console.ReadKey().KeyChar == 's');
            }
            catch (Exception)
            {
                Console.WriteLine("Fallo en adicionar el objeto !!!");
            }
            finally
            {
                arch.Close();
            }
        }
        public void listar() {
        	Console.WriteLine("\n\nMostrando participantes: ");
            // Abrimos el archivo o se crea un nuevo archivo si no existe
            Stream arch = File.Open(nomP, FileMode.OpenOrCreate);
            BinaryReader lee = new BinaryReader(arch);
            
            Participante p = new Participante();
            try {
                while( true ) {
                    //lectura fisica desde el archivo
                    p.lectura(lee);
                    p.mostrar();
                }
            }
            catch( Exception ) {
                Console.WriteLine("Fin de archivo ...");
            }
            finally {
                arch.Close();
            }
         }
        public void cuantos()
        {
        	Console.WriteLine("\n");
            // Abrimos el archivo o se crea un nuevo archivo si no existe
            Stream arch = File.Open(nomP, FileMode.OpenOrCreate);
            BinaryReader lee = new BinaryReader(arch);
            int c = 0;
            Participante p = new Participante();
            Console.WriteLine("Leer categoria X: ");
            string x = Console.ReadLine();
            Console.WriteLine("Leer departamento Y: ");
            string y = Console.ReadLine();
            try
            {
                while (true)
                {
                    //lectura fisica desde el archivo
                    p.lectura(lee);
                    if (p.Categoria == x && p.Departamento == y) {
                    	c++;
                    }
                }
            }
            catch (Exception)
            {
            	Console.WriteLine("Existen " + c + " participantes en " + x + " de " + y);
            }
            finally
            {
                arch.Close();
            }
        }
        public void Listar() {
        	Console.WriteLine("\n");
            // Abrimos el archivo o se crea un nuevo archivo si no existe
            Stream arch = File.Open(nomP, FileMode.OpenOrCreate);
            BinaryReader lee = new BinaryReader(arch);
            Participante p = new Participante();
            Console.WriteLine("Leer departamento X: ");
            string x = Console.ReadLine();
            Console.WriteLine("Leer municipio Y: ");
            string y = Console.ReadLine();
            Console.WriteLine("Mostrando participantes de " + x + ", " + y + ": ");
            try {
                while( true ) {
                    //lectura fisica desde el archivo
                    p.lectura(lee);
                    if (p.Departamento == x && p.Municipio == y) {
                    	p.Mostrar();
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
        public int MayorP(string x) {
        	Console.WriteLine();
            // Abrimos el archivo o se crea un nuevo archivo si no existe
            Stream arch = File.Open(nomP, FileMode.OpenOrCreate);
            BinaryReader lee = new BinaryReader(arch);
            Participante p = new Participante();
            int m = 0;
            try {
                while( true ) {
                    //lectura fisica desde el archivo
                    p.lectura(lee);
                    if (p.Puntaje > m && p.Categoria == x) {
                    	m = p.Puntaje;
                    }
                }
            }
            catch( Exception ) {
            }
            finally {
                arch.Close();
            }
            return m;
         }
        public void ListarP(int m, string x) {
        	Console.WriteLine();
            // Abrimos el archivo o se crea un nuevo archivo si no existe
            Stream arch = File.Open(nomP, FileMode.OpenOrCreate);
            BinaryReader lee = new BinaryReader(arch);
            Participante p = new Participante();;
            Console.WriteLine("Mostrando participantes con mayor puntaje (" + m + ") categoria " + x + ": ");
            try {
                while( true ) {
                    //lectura fisica desde el archivo
                    p.lectura(lee);
                    
                    if (p.Puntaje == m && p.Categoria == x) {
                    	p.MostrarP();
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
