
import java.util.Scanner;

    public class Persona
    {
        private String Nombre;
        /*public string nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }*/
        private String Nacionalidad;
        /*public string nacionalidad
        {
            get { return Nacionalidad; }
            set { Nacionalidad = value; }
        }*/
        private int Edad;

    public Persona(String Nombre, String Nacionalidad, int Edad) {
        this.Nombre = Nombre;
        this.Nacionalidad = Nacionalidad;
        this.Edad = Edad;
    }

    public int getEdad() {
        return Edad;
    }

    public String getNacionalidad() {
        return Nacionalidad;
    }

    public String getNombre() {
        return Nombre;
    }
        
        /*public int edad
        {
            get { return Edad; }
            set { Edad = value; }
        }*/
    Scanner sc = new Scanner(System.in);
        /*
        System.out.println(
        sc.nextLine();
        */
        public void Leer()
        {
            System.out.println("Leer Nombre");
            Nombre = sc.nextLine();
            System.out.println("Leer Nacionalidad: ");
            Nacionalidad = sc.nextLine();
            System.out.println("Leer edad");
            Edad = sc.nextInt();
        }
        public void Mostrar()
        {
            System.out.println(Nombre + " " + Nacionalidad + " " + Edad);
        }

    }
