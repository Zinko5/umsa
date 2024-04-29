
import java.util.Scanner;

    public class Cine extends Arte
    {

    public Cine(String Genero, int AñodePublicacion, String NombredelaObra, String Popularidad, String Aceptacion) {
        super(AñodePublicacion, NombredelaObra, Popularidad, Aceptacion);
        this.Genero = Genero;
    }
        private String Genero;
        /*public string genero
        {
            get { return Genero; }
            set { Genero = value; }
        }*/
        Scanner sc = new Scanner(System.in);
        /*
        System.out.println(
        sc.nextInt();
        */
        public void Leer()
        {
            System.out.println("Leer genero: ");
            Genero = sc.nextLine();
        }
        public void Mostrar()
        {
            super.Mostrar();
            System.out.println(Genero);
        }
    }
