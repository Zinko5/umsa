
import java.util.Scanner;

    public class Pintura extends Arte
    {

    public Pintura(String Tecnica, int AñodePublicacion, String NombredelaObra, String Popularidad, String Aceptacion) {
        super(AñodePublicacion, NombredelaObra, Popularidad, Aceptacion);
        this.Tecnica = Tecnica;
    }
        private String Tecnica;/*
        public string tecnica
        {
            get { return Tecnica; }
            set { Tecnica = value; }
        }*/
        Scanner sc = new Scanner(System.in);
        /*
        System.out.println(
        sc.nextLine();
        */
        public void Leer()
        {
            System.out.println("Leer genero: ");
            Tecnica = sc.nextLine();
        }
        public void Mostrar()
        {
            super.Mostrar();
            System.out.println(Tecnica);
        }
    }
