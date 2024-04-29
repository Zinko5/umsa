
import java.util.Scanner;

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
        Scanner sc = new Scanner(System.in);
        /*
        System.out.println(
        sc.nextInt();
        */
        public void Leer()
        {
            System.out.println("Leer numero de partes: ");
            nroIngredientes = sc.nextInt();
            for (int i = 0; i < nroIngredientes; i++)
            {
                System.out.println("Leer parte de la vestimenta: ");
                Ingredientes[i] = sc.nextLine();
            }
        }
        public void Mostrar()
        {
            super.Mostrar();
            System.out.println(nroIngredientes);
            for (int i = 0; i < nroIngredientes; i++)
            {
                System.out.println(Ingredientes[i]);
            }
        }
    }
