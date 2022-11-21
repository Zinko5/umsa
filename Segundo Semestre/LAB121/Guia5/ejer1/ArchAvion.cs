using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

namespace ejer1
{
    public class ArchAvion
    {
        private string nomArch;

        public ArchAvion(string nomArch)
        {
            this.nomArch = nomArch;
        }

        public string NomArch
        {
            get { return nomArch; }
            set { nomArch = value; }
        }
        private Avion regAvion;
        public Avion RegAvion
        {
            get { return regAvion; }
            set { regAvion = value; }
        }
        
        public void crear() {
			if( System.IO.File.Exists(nomArch) ) {
				Console.WriteLine("Realmente quiere borrar el archivo?. s/n");
				if( Console.ReadKey().KeyChar == 's' )
					System.IO.File.Delete(NomArch);
				}
				else
					Console.WriteLine("El archivo no existe.");
		}
		public void adicionar() {
			// Abrimos el archivo o se crea un nuevo archivo si no existe
			Stream arch = File.Open(nomArch, FileMode.Append);
			BinaryWriter escribe = new BinaryWriter(arch);
			Avion a = new Avion();
			try {
				do {
					Console.WriteLine();
					a.Leer();
					//escritura física en el archivo
					a.Escritura(escribe);
					Console.Write("Desea continuar añadiendo aviones? s/n => ");
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
			Stream arch = File.Open(nomArch, FileMode.OpenOrCreate);
			BinaryReader lee = new BinaryReader(arch);
			Avion a = new Avion();
			try {
                System.Console.WriteLine("Mostrando aviones: ");
				while( true ) {
					//lectura fisica desde el archivo
					a.Lectura(lee);
					a.Mostrar();
				}
			}
			catch( Exception ) {
				Console.WriteLine("Fin de archivo ...");
			}
			finally {
				arch.Close();
			}
		}
        public void Eliminar()
        {
            System.Console.WriteLine("Leer matricula M para eliminar: ");
            string M = Console.ReadLine();
            Stream arch = File.Open(nomArch, FileMode.OpenOrCreate);
            BinaryReader lee = new BinaryReader(arch);
            BinaryWriter escribe = new BinaryWriter(arch);
            Avion a = new Avion();
            try
            {
                while (true)
                {
                    a.Lectura(lee);
                    if (a.Matricula == M)
                    {
                        a.Eliminar(escribe);
                    }
                }
            }
            catch (Exception)
            {
                System.Console.WriteLine("Avion eliminado");
            }
            finally {
				arch.Close();
			}
        }
    }
}