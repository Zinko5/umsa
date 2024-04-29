
import java.util.Scanner;

    public class Artista extends Persona
    {
        private String Disciplina;
        /*public string disciplina
        {
            get { return Disciplina; }
            set { Disciplina = value; }
        }*/
        public void Mostrar()
        {
            super.Mostrar();
            System.out.println(Disciplina);
        }
        public void Leer()
        {
            super.Leer();
            System.out.println("Leer disciplina: ");
            Disciplina = sc.nextLine();
        }
        

    public Artista(String Disciplina, String Nom, String Nac, int Ed) {
        super(Nom, Nac, Ed);
        this.Disciplina = Disciplina;
    }

    public String getDisciplina() {
        return Disciplina;
    }
}
