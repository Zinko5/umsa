import java.util.Scanner;
public class EspacioMunicipalCultural
    {
    public EspacioMunicipalCultural(String NombredelEspacio) {
        this.NombredelEspacio = NombredelEspacio;
        this.Tipo = "Campo Ferial";
        this.AforoDisponible = 13000;
        this.Ubicacion = "Calle Michel";
        this.Estado = "Bueno";
        this.nroEventos = 2;
        Eventos [0] = new Evento("Feria del Libro");
        Eventos [1] = new Evento(1050);
    }
    public EspacioMunicipalCultural(int aforo) {
        //Teatro al Aire Libre", "Escenario", "9000", "Av. del Ejercito", "Bueno", 2
        this.NombredelEspacio = "Teatro al Aire Libre";
        this.Tipo = "Escenario";
        this.AforoDisponible = aforo;
        this.Ubicacion = "Av. del Ejercito";
        this.Estado = "Bueno";
        this.nroEventos = 2;
        Eventos [0] = new Evento("Concierto de La Casa Azul", 10000);
        Eventos [1] = new Evento(8700, "Concierto de Sabina");
    }
        private String NombredelEspacio;
        /*public string nombredelEspacio
        {
            get { return NombredelEspacio; }
            set { NombredelEspacio = value; }
        }*/
        private String Tipo;
        /*public string tipo
        {
            get { return Tipo; }
            set { Tipo = value; }
        }*/
        private int AforoDisponible;
        /*public string aforoDisponible
        {
            get { return AforoDisponible; }
            set { AforoDisponible = value; }
        }*/
        private String Ubicacion;
        /*public string ubicacion
        {
            get { return Ubicacion; }
            set { Ubicacion = value; }
        }*/
        private String Estado;
        /*public string estado
        {
            get { return Estado; }
            set { Estado = value; }
        }*/
        private int nroEventos;
        /*public int NroEventos
        {
            get { return nroEventos; }
            set { nroEventos = value; }
        }*/
        private Evento []Eventos = new Evento [300];
        Scanner sc = new Scanner(System.in);

    public int getAforoDisponible() {
        return AforoDisponible;
    }

    public String getNombredelEspacio() {
        return NombredelEspacio;
    }

    public String getEstado() {
        return Estado;
    }

    public int getNroEventos() {
        return nroEventos;
    }

    public String getUbicacion() {
        return Ubicacion;
    }

    public String getTipo() {
        return Tipo;
    }

    public Evento getEvento0() {
        return Eventos[0];
    }
    public Evento getEvento1() {
        return Eventos[1];
    }
    
        
        public EspacioMunicipalCultural()
        {
        }
        public void Leer()
        {
            System.out.println("Leer nombre del espacio: ");
            NombredelEspacio = sc.nextLine();
            System.out.println("Leer tipo (biliboteca, auditorio, escenario): ");
            Tipo = sc.nextLine();
            System.out.println("Leer aforo disponible: ");
            AforoDisponible = sc.nextInt();
            System.out.println("Leer ubicacion: ");
            Ubicacion = sc.nextLine();
            System.out.println("Leer estado: ");
            Estado = sc.nextLine();
            System.out.println("Leer numero de eventos agendados: ");
            nroEventos = sc.nextInt();
            for (int i = 0; i < nroEventos; i++)
            {
                Eventos[i] = new Evento();
                Eventos[i].Leer();
            }
        }
        public void Mostrar()
        {
            System.out.println("Mostrando espacio: ");
            System.out.println(NombredelEspacio + " " + Tipo + " " + AforoDisponible + " " + Ubicacion + " " + Estado + " " + nroEventos);
            for (int i = 0; i < nroEventos; i++)
            {
                Eventos[i].Mostrar();
            }
        }
        public void Añadir(Evento Evento)
        {
            Eventos[nroEventos] = Evento;
            nroEventos ++;
        }
    }
