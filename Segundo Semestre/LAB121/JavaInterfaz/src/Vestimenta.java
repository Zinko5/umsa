
import java.util.Scanner;

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
        Scanner sc = new Scanner(System.in);
        /*
        System.out.println(
        sc.nextLine();
        */
        public void Leer()
        {
            System.out.println("Leer numero de partes: ");
            nroPartes = sc.nextInt();
            for (int i = 0; i < nroPartes; i++)
            {
                System.out.println("Leer parte de la vestimenta: ");
                Partes[i] = sc.nextLine();
            }
        }
        public void Mostrar()
        {
            super.Mostrar();
            System.out.println(nroPartes);
            for (int i = 0; i < nroPartes; i++)
            {
                System.out.println(Partes[i]);
            }
        }
    }
