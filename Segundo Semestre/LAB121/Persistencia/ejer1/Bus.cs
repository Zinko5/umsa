using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

namespace persistencia
{
	[Serializable]
	public class Bus
	{
		private string Codigo;
		
		public String codigo {
			get { return Codigo; }
			set { Codigo = value; }
		}
		private string Tipo;
		
		public string tipo {
			get { return Tipo; }
			set { Tipo = value; }
		}
		private string Conductor;
		
		public string conductor {
			get { return Conductor; }
			set { Conductor = value; }
		}
		private string Anfitrion;
		
		public string anfitrion {
			get { return Anfitrion; }
			set { Anfitrion = value; }
		}
		private string NomRuta;
		
		public string nomRuta {
			get { return NomRuta; }
			set { NomRuta = value; }
		}
		private int Capacidad;
		
		public int capacidad {
			get { return Capacidad; }
			set { Capacidad = value; }
		}
		public Bus()
		{
			Codigo = "Codigo por defecto";
			Tipo = "Tipo por defecto";
			Anfitrion = "Anfitrion por defecto";
			NomRuta = "Nombre de ruta por defecto";
			Capacidad = 30;
		}
		public void Leer() {
			Console.WriteLine("Leyendo bus:\nLeer codigo: ");
			Codigo = Console.ReadLine();
			Console.WriteLine("Leer tipo: ");
			Tipo = Console.ReadLine();
			Console.WriteLine("Leer conductor: ");
			Conductor = Console.ReadLine();
			Console.WriteLine("Leer anfitrion: ");
			Anfitrion = Console.ReadLine();
			Console.WriteLine("Leer nombre de la ruta: ");
			NomRuta = Console.ReadLine();
			Console.WriteLine("Leer capacidad: ");
			Capacidad = int.Parse(Console.ReadLine());
		}
		public void Mostrar() {
			Console.WriteLine("Mostrando bus:\n" + Codigo + " " + Tipo + " " + Conductor + " " + Anfitrion + " " + NomRuta + " " + Capacidad);
		}
		public void Escribir(BinaryWriter escritor) {
			escritor.Write(this.Codigo);
			escritor.Write(this.Tipo);
			escritor.Write(this.Conductor);
			escritor.Write(this.Anfitrion);
			escritor.Write(this.NomRuta);
			escritor.Write(this.Capacidad);
		}
		public void Lectura(BinaryReader lector)  {
			this.Codigo = lector.ReadString();
			this.Tipo = lector.ReadString();
			this.Conductor = lector.ReadString();
			this.Anfitrion = lector.ReadString();
			this.NomRuta = lector.ReadString();
			this.Capacidad = lector.ReadInt32();
		}
	}
}
