
import java.util.Scanner;


    public class Arte
    {
        private int AñodePublicacion;

    /*public Arte(int AñodePublicacion, String NombredelaObra) {
        this.AñodePublicacion = AñodePublicacion;
        this.NombredelaObra = NombredelaObra;
    }*/

    public String getNombredelaObra() {
        return NombredelaObra;
    }

    public int getAñodePublicacion() {
        return AñodePublicacion;
    }
        /*public int añodePublicacion
        {
            get { return AñodePublicacion; }
            set { AñodePublicacion = value; }
        }*/
        private String NombredelaObra;
        private String Popularidad;
        private String Aceptacion;
        /*public String nombredelaObra
        {
            get { return NombredelaObra; }
            set { NombredelaObra = value; }
        }*/
        Scanner sc = new Scanner(System.in);
        public void Leer()
        {
            System.out.println("Leer el año de publicacion de la obra: ");
            AñodePublicacion = sc.nextInt();
            System.out.println("Leer el nombre de la obra: ");
            NombredelaObra = sc.nextLine();
        }
        public void Mostrar()
        {
            System.out.println(AñodePublicacion + " " + NombredelaObra);
        }

    public String getPopularidad() {
        return Popularidad;
    }

    public String getAceptacion() {
        return Aceptacion;
    }

    public Arte(int AñodePublicacion, String NombredelaObra, String Popularidad, String Aceptacion) {
        this.AñodePublicacion = AñodePublicacion;
        this.NombredelaObra = NombredelaObra;
        this.Popularidad = Popularidad;
        this.Aceptacion = Aceptacion;
    }
    }
