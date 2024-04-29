
import java.util.Scanner;

    public class Danza extends Arte
    {

    public Danza(String Ritmo, int AñodePublicacion, String NombredelaObra, String Popularidad, String Aceptacion) {
        super(AñodePublicacion, NombredelaObra, Popularidad, Aceptacion);
        this.Ritmo = Ritmo;
    }
        private String Ritmo;
        /*public string ritmo
        {
            get { return Ritmo; }
            set { Ritmo = value; }
        }*/
        Scanner sc = new Scanner(System.in);
        /*
        System.out.println(
        sc.nextLine();
        */
        public void Leer()
        {
            System.out.println("Leer genero: ");
            Ritmo = sc.nextLine();
        }
        public void Mostrar()
        {
            super.Mostrar();
            System.out.println(Ritmo);
        }
    }
