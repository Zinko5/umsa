    public class EspacioMunincipalCultural
    {
        private string NombredelEspacio;
        public string nombredelEspacio
        {
            get { return NombredelEspacio; }
            set { NombredelEspacio = value; }
        }
        private string Tipo;
        public string tipo
        {
            get { return Tipo; }
            set { Tipo = value; }
        }
        private string AforoDisponible;
        public string aforoDisponible
        {
            get { return AforoDisponible; }
            set { AforoDisponible = value; }
        }
        private string Ubicacion;
        public string ubicacion
        {
            get { return Ubicacion; }
            set { Ubicacion = value; }
        }
        private string Estado;
        public string estado
        {
            get { return Estado; }
            set { Estado = value; }
        }
        private int nroEventos;
        public int NroEventos
        {
            get { return nroEventos; }
            set { nroEventos = value; }
        }
        private Evento []Eventos = new Evento [300];

        public EspacioMunincipalCultural()
        {
        }
        public void Leer()
        {
            System.Console.WriteLine("Leer nombre del espacio: ");
            NombredelEspacio = Console.ReadLine();
            System.Console.WriteLine("Leer tipo (biliboteca, auditorio, escenario): ");
            Tipo = Console.ReadLine();
            System.Console.WriteLine("Leer aforo disponible: ");
            AforoDisponible = Console.ReadLine();
            System.Console.WriteLine("Leer ubicacion: ");
            Ubicacion = Console.ReadLine();
            System.Console.WriteLine("Leer estado: ");
            Estado = Console.ReadLine();
            System.Console.WriteLine("Leer numero de eventos agendados: ");
            nroEventos = int.Parse(Console.ReadLine());
            for (int i = 0; i < nroEventos; i++)
            {
                Eventos[i] = new Evento();
                Eventos[i].Leer();
            }
        }
        public void Mostrar()
        {
            System.Console.WriteLine("Mostrando espacio: ");
            System.Console.WriteLine(NombredelEspacio + " " + Tipo + " " + AforoDisponible + " " + Ubicacion + " " + Estado + " " + nroEventos);
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
