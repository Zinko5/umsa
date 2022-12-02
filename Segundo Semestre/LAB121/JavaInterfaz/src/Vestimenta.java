    public class Vestimenta extends Cultura
    {
        private int nroPartes;

    /*public int NroPartes
    {
    get { return nroPartes; }
    set { nroPartes = value; }
    }*/
    public Vestimenta(int nroPartes) {
        this.nroPartes = nroPartes;
    }

        private String []Partes = new String [20];
        /*public void Leer()
        {
            System.Console.WriteLine("Leer numero de partes: ");
            nroPartes = int.Parse(Console.ReadLine());
            for (int i = 0; i < nroPartes; i++)
            {
                System.Console.WriteLine("Leer parte de la vestimenta: ");
                Partes[i] = Console.ReadLine();
            }
        }
        public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(nroPartes);
            for (int i = 0; i < nroPartes; i++)
            {
                System.Console.WriteLine(Partes[i]);
            }
        }*/
    }
