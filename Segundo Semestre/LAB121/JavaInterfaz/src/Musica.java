
import java.util.Scanner;

    public class Musica extends Arte
    {
        private String Genero;
        /*public string genero
        {
            get { return Genero; }
            set { Genero = value; }
        }*/
        Scanner sc = new Scanner(System.in);
        /*
        System.out.println(
        sc.nextLine();
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

    public Musica(String gen, int apub, String nomobra, String pop, String acep) {
        super(apub, nomobra, pop, acep);
        this.Genero = gen;
    }
    }
