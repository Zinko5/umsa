import java.util.Scanner;
public class EspacioMunicipalCultural
    {
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
        private String AforoDisponible;
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
        //private Evento []Eventos = new Evento [300];
        Scanner sc = new Scanner(System.in);

    public String getAforoDisponible() {
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
        
        public EspacioMunicipalCultural()
        {
        }

    public EspacioMunicipalCultural(String NombredelEspacio, String Tipo, String AforoDisponible, String Ubicacion, String Estado, int nroEventos) {
        this.NombredelEspacio = NombredelEspacio;
        this.Tipo = Tipo;
        this.AforoDisponible = AforoDisponible;
        this.Ubicacion = Ubicacion;
        this.Estado = Estado;
        this.nroEventos = nroEventos;
    }
        
        public void Leer()
        {
            System.out.println("Leer nombre del espacio: ");
            NombredelEspacio = sc.nextLine();
            System.out.println("Leer tipo (biliboteca, auditorio, escenario): ");
            Tipo = sc.nextLine();
            System.out.println("Leer aforo disponible: ");
            AforoDisponible = sc.nextLine();
            System.out.println("Leer ubicacion: ");
            Ubicacion = sc.nextLine();
            System.out.println("Leer estado: ");
            Estado = sc.nextLine();
            System.out.println("Leer numero de eventos agendados: ");
            nroEventos = sc.nextInt();
            /*for (int i = 0; i < nroEventos; i++)
            {
                Eventos[i] = new Evento();
                Eventos[i].Leer();
            }*/
        }
        public void Mostrar()
        {
            System.out.println("Mostrando espacio: ");
            System.out.println(NombredelEspacio + " " + Tipo + " " + AforoDisponible + " " + Ubicacion + " " + Estado + " " + nroEventos);
            /*for (int i = 0; i < nroEventos; i++)
            {
                Eventos[i].Mostrar();
            }*/
        }
        /*public void Añadir(Evento Evento)
        {
            Eventos[nroEventos] = Evento;
            nroEventos ++;
        }*/
    }
