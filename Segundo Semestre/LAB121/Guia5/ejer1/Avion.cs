using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

namespace ejer1
{
    public class Avion
    {
        private string matricula;
        public string Matricula
        {
            get { return matricula; }
            set { matricula = value; }
        }
        private string origen;
        public string Origen
        {
            get { return origen; }
            set { origen = value; }
        }
        private string destino;
        public string Destino
        {
            get { return destino; }
            set { destino = value; }
        }
        private string horaSalida;
        public string HoraSalida
        {
            get { return horaSalida; }
            set { horaSalida = value; }
        }
        private string nombrePiloto;
        public string NombrePiloto
        {
            get { return nombrePiloto; }
            set { nombrePiloto = value; }
        }
        public Avion(string matricula, string origen, string destino, string horaSalida, string nombrePiloto)
        {
            this.matricula = matricula;
            this.origen = origen;
            this.destino = destino;
            this.horaSalida = horaSalida;
            this.nombrePiloto = nombrePiloto;
        }
        public Avion()
        {
        }
        public void Leer()
        {
            System.Console.WriteLine("Leyendo Avion\nLeer matricula:");
            matricula = Console.ReadLine();
            System.Console.WriteLine("Leer origen:");
            origen = Console.ReadLine();
            System.Console.WriteLine("Leer destino:");
            destino = Console.ReadLine();
            System.Console.WriteLine("Leer hora de salida:");
            horaSalida = Console.ReadLine();
            System.Console.WriteLine("Leer nombre del piloto:");
            nombrePiloto = Console.ReadLine();
        }
        public void Mostrar()
        {
            System.Console.WriteLine(matricula + " " + origen + " " + destino + " " + horaSalida + " " + nombrePiloto);
        }
        public void Escritura(BinaryWriter escritor) {
			escritor.Write(this.matricula);
            escritor.Write(this.origen);
            escritor.Write(this.destino);
            escritor.Write(this.horaSalida);
            escritor.Write(this.nombrePiloto);

		}
		public void Lectura(BinaryReader lector)  {
			this.matricula = lector.ReadString();
            this.origen = lector.ReadString();
            this.destino = lector.ReadString();
            this.horaSalida = lector.ReadString();
            this.nombrePiloto = lector.ReadString();

		}
        public void Eliminar(BinaryWriter escritor)
        {
            this.matricula = "";
            this.origen = "";
            this.destino = "";
            this.horaSalida = "";
            this.nombrePiloto = "";
            escritor.Write(this.matricula);
            escritor.Write(this.origen);
            escritor.Write(this.destino);
            escritor.Write(this.horaSalida);
            escritor.Write(this.nombrePiloto);
        }
    }
}