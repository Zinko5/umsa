using System.IO;
using System;
using System.Linq;
using System.Text;
using System.Collections.Generic;

namespace defensa5
{
	public class Participante
	{
		string departamento;
		
		public string Departamento {
			get { return departamento; }
			set { departamento = value; }
		}
		string municipio;
		
		public string Municipio {
			get { return municipio; }
			set { municipio = value; }
		}
		string categoria;
		
		public string Categoria {
			get { return categoria; }
			set { categoria = value; }
		}
		string especialidad;
		
		public string Especialidad {
			get { return especialidad; }
			set { especialidad = value; }
		}
		string nomParticipante;
		
		public string NomParticipante {
			get { return nomParticipante; }
			set { nomParticipante = value; }
		}
		int puntaje;
		
		public int Puntaje {
			get { return puntaje; }
			set { puntaje = value; }
		}
		public Participante()
		{
		}
		public void leer()
        {
            Console.WriteLine("Leyendo datos del participante:\nLeer departamento:");
            departamento = Console.ReadLine();
            Console.WriteLine("Leer municipio");
            municipio = Console.ReadLine();
            Console.WriteLine("Leer categoria");
            categoria = Console.ReadLine();
            Console.WriteLine("Leer especialidad");
            especialidad = Console.ReadLine();
            Console.WriteLine("Leer nombre");
            nomParticipante = Console.ReadLine();
            do {
            	Console.WriteLine("Leer puntaje");
            	puntaje = int.Parse(Console.ReadLine());
            	if (puntaje < 0 || puntaje > 100) {
            		//verifica puntaje
            		Console.WriteLine("Error. El puntaje debe estar entre 0 y 100, vuelva a introducirlo");
            	}
            } while (puntaje < 0 || puntaje > 100);
            
        }
        public void mostrar()
        {
        	Console.WriteLine(departamento + ", " + municipio + ", " + categoria + ", " + especialidad + ", " + nomParticipante + ", " + puntaje);
        }
        public void escribir(BinaryWriter escritor)
        {
            escritor.Write(this.departamento);
            escritor.Write(this.municipio);
            escritor.Write(this.categoria);
            escritor.Write(this.especialidad);
            escritor.Write(this.nomParticipante);
            escritor.Write(this.puntaje);
        }
        public void lectura(BinaryReader lector)
        {
            this.departamento = lector.ReadString();
            this.municipio= lector.ReadString();
            this.categoria= lector.ReadString();
            this.especialidad = lector.ReadString();
            this.nomParticipante = lector.ReadString();
            this.puntaje = lector.ReadInt32();
        }
        public void Mostrar(){
        	Console.WriteLine(nomParticipante + ", " + categoria + ", " + especialidad);
        }
        public void MostrarP(){
        	Console.WriteLine(nomParticipante + ", " + departamento);
        }
	}
}
