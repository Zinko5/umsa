
import java.util.Scanner;

    public class Cultura
    {
        private String Historia;
        /*public string historia
        {
            get { return Historia; }
            set { Historia = value; }
        }*/
        Scanner sc = new Scanner(System.in);
        /*
        System.out.println(
        sc.nextLine();
        */
        public void Leer()
        {
            System.out.println("Leer Historia: ");
            Historia = sc.nextLine();
        }
        public void Mostrar()
        {
            System.out.println(Historia);
        }
    }
