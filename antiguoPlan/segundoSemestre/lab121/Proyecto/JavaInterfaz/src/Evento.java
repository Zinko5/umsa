
import java.util.Scanner;

    public class Evento
    {
        private String NombredelEvento;
        /*public string nombredelEvento
        {
            get { return NombredelEvento; }
            set { NombredelEvento = value; }
        }*/
        private String FechadelEvento;
        /*public string fechadelEvento
        {
            get { return FechadelEvento; }
            set { FechadelEvento = value; }
        }*/
        private int Aforo;
        /*public int aforo
        {
            get { return Aforo; }
            set { Aforo = value; }
        }*/
        private int nroArtistas;
        /*public int NroArtistas
        {
            get { return nroArtistas; }
            set { nroArtistas = value; }
        }*/
        private int nroObras;
        /*public int NroObras
        {
            get { return nroObras; }
            set { nroObras = value; }
        }*/
        private Artista []Artistas = new Artista[500];
        private Arte []Obras = new Arte[1000];
        Scanner sc = new Scanner(System.in);

    public void setNombredelEvento(String NombredelEvento) {
        this.NombredelEvento = NombredelEvento;
    }

    

    
    
        
        public Evento()
        {
        }
        public Evento(String n)
        {
            NombredelEvento = n;
            FechadelEvento = "15/07/21";
            Aforo = 6400;
            nroArtistas = 2;
            nroObras = 2;
            Artistas[0] = new Artista("Literatura", "Arthur Connan", "Escocia", 50);
            Artistas[1] = new Artista("Literatura", "Garcia Marquez", "Colombia", 34);
            Obras[0] = new Literatura("Aventura Fantastica", 2015, "El Mundo Perdido", "Mediocre", "Buena");
            Obras[1] = new Literatura("Detectives" ,2002, "Sherlock Holmes", "Excelente", "Muy buena");
            Obras[2] = new Literatura("Drama" ,2008, "Cien años de Soledad", "Excelente", "Excelente");
        }
        public Evento(int a)
        {
            NombredelEvento = "Tatto Art Bolivia";
            FechadelEvento = "29/10/22";
            Aforo = a;
            nroArtistas = 2;
            nroObras = 2;
            Artistas[0] = new Artista("Modificaciones Corporales", "Black Alien", "Francia", 35);
            Artistas[1] = new Artista("Tatuajes", "Luis Bonilla", "Costa Rica", 41);
            Obras[0] = new Arte(2016, "Modificaciones Corporales", "Buena", "Mala");
            Obras[1] = new Arte(2010, "Tatuajes", "Mala", "Mediocre");
        }
        public Evento(String n, int a)
        {
            NombredelEvento = n;
            FechadelEvento = "05/03/20";
            Aforo = a;
            nroArtistas = 1;
            nroObras = 1;
            Artistas[0] = new Artista("Musica", "Guille Milkyway", "España", 41);
            Obras[0] = new Musica("Indie Pop", 2016, "La Gran Esfera", "Buena", "Muy buena");
            Obras[1] = new Musica("Indie Pop", 2012, "Galletas", "Muy buena", "Buena");
            Obras[2] = new Musica("Indie Pop", 2019, "Podria ser Peor", "Muy buena", "Excelente");
        }
        public Evento(int a, String n)
        {
            NombredelEvento = n;
            FechadelEvento = "10/09/21";
            Aforo = a;
            nroArtistas = 1;
            nroObras = 1;
            Artistas[0] = new Artista("Musica", "Sabina", "España", 52);
            Obras[0] = new Musica("Pop", 2013, "La Cancion mas Bonita del Mundo", "Buena", "Muy buena");
        }
        public void Leer()
        {
            System.out.println("Leer nombre del evento: ");
            NombredelEvento = sc.nextLine();
            System.out.println("Leer fecha del evento (dd/mm/yy): ");
            FechadelEvento = sc.nextLine();
            System.out.println("Leer aforo: ");
            Aforo = sc.nextInt();
            System.out.println("Leer numero de artistas invitados: ");
            nroArtistas = sc.nextInt();
            System.out.println("Leer numero de obras de arte: ");
            nroObras = sc.nextInt();
            /*for (int i = 0; i < nroArtistas; i++)
            {
                Artistas[i] = new Artista();
                Artistas[i].Leer();
            }
            for (int i = 0; i < nroObras; i++)
            {
                Obras[i] = new Arte();
                Obras[i].Leer();
            }*/
        }
        public int getAforo() {
        return Aforo;
    }

    public String getFechadelEvento() {
        return FechadelEvento;
    }

    public String getNombredelEvento() {
        return NombredelEvento;
    }

    public int getNroArtistas() {
        return nroArtistas;
    }

    public int getNroObras() {
        return nroObras;
    }

    public Artista getArtistas0() {
        return Artistas[0];
    }

    public Arte getObras0() {
        return Obras[0];
    }
    public Artista getArtistas1() {
        return Artistas[1];
    }

    public Arte getObras1() {
        return Obras[1];
    }
    public Arte getObras2() {
        return Obras[2];
    }
        public void Mostrar()
        {
            System.out.println("Mostrando evento: ");
            System.out.println(NombredelEvento + " " + FechadelEvento + " " + Aforo + " " + nroArtistas + " " + nroObras);
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
            Obras[nroObras] = Arte;
            nroObras ++;
        }
        public void Añadir(Artista Artista)
        {
            Artistas[nroArtistas] = Artista;
            nroArtistas ++;
        }
    }
