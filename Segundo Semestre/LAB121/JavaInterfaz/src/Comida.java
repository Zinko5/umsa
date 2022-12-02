    public class Comida extends Cultura
    {

    public Comida(int nroIngredientes) {
        this.nroIngredientes = nroIngredientes;
    }
        private int nroIngredientes;
        /*public int NroIngredientes
        {
            get { return nroIngredientes; }
            set { nroIngredientes = value; }
        }*/
        private String []Ingredientes = new String[50];
        /*public void Leer()
        {
            System.Console.WriteLine("Leer numero de partes: ");
            nroIngredientes = int.Parse(Console.ReadLine());
            for (int i = 0; i < nroIngredientes; i++)
            {
                System.Console.WriteLine("Leer parte de la vestimenta: ");
                Ingredientes[i] = Console.ReadLine();
            }
        }
        public void Mostrar()
        {
            base.Mostrar();
            System.Console.WriteLine(nroIngredientes);
            for (int i = 0; i < nroIngredientes; i++)
            {
                System.Console.WriteLine(Ingredientes[i]);
            }
        }*/
    }
