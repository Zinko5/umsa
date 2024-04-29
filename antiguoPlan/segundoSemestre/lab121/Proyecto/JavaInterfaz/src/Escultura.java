
import java.util.Scanner;

    public class Escultura extends Arte
    {

    public Escultura(String Material, int AñodePublicacion, String NombredelaObra, String Popularidad, String Aceptacion) {
        super(AñodePublicacion, NombredelaObra, Popularidad, Aceptacion);
        this.Material = Material;
    }
        private String Material;
        /*public string material
        {
            get { return Material; }
            set { Material = value; }
        }*/
        Scanner sc = new Scanner(System.in);
        /*
        System.out.println(
        sc.nextLine();
        */
        public void Leer()
        {
            System.out.println("Leer genero: ");
            Material = sc.nextLine();
        }
        public void Mostrar()
        {
            super.Mostrar();
            System.out.println(Material);
        }
    }
