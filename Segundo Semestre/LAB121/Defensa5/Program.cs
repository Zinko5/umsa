using System;

namespace defensa5
{
	class Program
	{
		public static void Main(string[] args)
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
                Console.WriteLine("4. CONTAR CATEGORIA X DEPARTAMENTO Y ");
                Console.WriteLine("5. LISTAR DEPARTAMENTO X MUNICIPIO Y");
                Console.WriteLine("6. LISTAR MAYOR PUNTAJE");
                Console.WriteLine("0. SALIR ");
                Console.WriteLine(" ");
                Console.Write("INTRODUCIR UNA OPCION => ");
                ArchPartic ap = new ArchPartic(@"datos.txt");
                    
                switch( Console.ReadKey().KeyChar ) {
                    case '1':
                        ap.crear();
                        break;
                    case '2':
                        ap.adicionar();
                        break;
                    case '3':
                        ap.listar();
                        break;
                    case '4':
                        ap.cuantos();
                        break;
                    case '5':
                        ap.Listar();
                        break;
                    case '6':
                        Console.WriteLine("\n\nLeer categoria X:");
                        string x = Console.ReadLine();
                        int m = ap.MayorP(x);
                        ap.ListarP(m, x);
                        break;
                    default:
                        Console.WriteLine("\n\nEl programa ya termino !!!");
                        sw = false;
                        break;
                }
            }
		}
	}
}
