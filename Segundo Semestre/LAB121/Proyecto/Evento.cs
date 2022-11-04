using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Proyecto
{
    public class Evento
    {
        private string NombredelEvento;
        public string nombredelEvento
        {
            get { return NombredelEvento; }
            set { NombredelEvento = value; }
        }
        private string FechadelEvento;
        public string fechadelEvento
        {
            get { return FechadelEvento; }
            set { FechadelEvento = value; }
        }
        private int Aforo;
        public int aforo
        {
            get { return Aforo; }
            set { Aforo = value; }
        }
        private int nroArtistas;
        public int NroArtistas
        {
            get { return nroArtistas; }
            set { nroArtistas = value; }
        }
        private int nroObras;
        public int NroObras
        {
            get { return nroObras; }
            set { nroObras = value; }
        }
        private Artista []Artistas = new Artista[500];
        private Arte []Obras = new Arte[1000];
        public Evento()
        {
        }
        new public void Leer()
        {
            System.Console.WriteLine("Leer nombre del evento: ");
            NombredelEvento = Console.ReadLine();
            System.Console.WriteLine("Leer fecha del evento (dd/mm/yy): ");
            FechadelEvento = Console.ReadLine();
            System.Console.WriteLine("Leer aforo: ");
            Aforo = int.Parse(Console.ReadLine());
            System.Console.WriteLine("Leer numero de artistas invitados: ");
            nroArtistas = int.Parse(Console.ReadLine());
            System.Console.WriteLine("Leer numero de obras de arte: ");
            nroObras = int.Parse(Console.ReadLine());
            for (int i = 0; i < nroArtistas; i++)
            {
                Artistas[i] = new Artista();
                Artistas[i].Leer();
            }
            for (int i = 0; i < nroObras; i++)
            {
                Obras[i] = new Arte();
                Obras[i].Leer();
            }
        }
        public void Mostrar()
        {
            System.Console.WriteLine("Mostrando evento: ");
            System.Console.WriteLine(NombredelEvento + " " + FechadelEvento + " " + Aforo + " " + nroArtistas + " " + nroObras);
            for (int i = 0; i < nroArtistas; i++)
            {
                Artistas[i].Mostrar();
            }
            for (int i = 0; i < nroObras; i++)
            {
                Obras[i].Mostrar();
            }
        }
        public void Añadir(Arte Arte)
        {
            int c = 0;
            Obras[nroObras] = Arte;
            nroObras ++;
            for (int i = 0; i < nroArtistas; i++)
            {
                if (Arte.artista == Artistas[i])
                {
                    c = 1;
                }
            }
            if (c == 0)
            {
                Artistas[nroArtistas] = Arte.artista;
                nroArtistas ++;
            }
        }
    }
}