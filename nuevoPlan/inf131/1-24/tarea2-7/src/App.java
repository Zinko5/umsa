import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Vector;
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("\nGabriel Marcelo Muñoz Callisaya CI: 9873103");
        System.out.println("\nArrayList String:");
        ArrayList<String> alS = new ArrayList<String>();
        alS.add("cad1");
        alS.add("cad2");
        System.out.println(alS.get(0) + " " + alS.size() + " " + alS.contains("cad2") + " " + alS.remove(0) + " " + alS.isEmpty());
        System.out.println("\nArrayList Integer:");
        ArrayList<Integer> alI = new ArrayList<Integer>();
        alI.add(2);
        alI.add(4);
        System.out.println(alI.get(0) + " " + alI.size() + " " + alI.contains(6) + " " + alI.remove(0) + " " + alI.isEmpty());
        System.out.println("\nArrayList Persona:");
        ArrayList<Persona> alP = new ArrayList<Persona>();
        alP.add(new Persona("Jose", 24));
        alP.add(new Persona("Pepe", 20));
        System.out.println(alP.get(0).getNom() + " " + alP.get(0).getEdad() + " " + alP.size() + " " + alP.remove(0) + " " + alP.isEmpty());
        
        System.out.println("\nLinkedList String:");
        LinkedList<String> llS = new LinkedList<String>();
        llS.add("cad1");
        llS.add("cad2");
        System.out.println(llS.get(0) + " " + llS.size() + " " + llS.contains("cad2") + " " + llS.remove(0) + " " + llS.isEmpty());
        System.out.println("\nLinkedList Integer:");
        LinkedList<Integer> llI = new LinkedList<Integer>();
        llI.add(2);
        llI.add(4);
        System.out.println(llI.get(0) + " " + llI.size() + " " + llI.contains(6) + " " + llI.remove(0) + " " + llI.isEmpty());
        System.out.println("\nLinkedList Persona:");
        LinkedList<Persona> llP = new LinkedList<Persona>();
        llP.add(new Persona("Jose", 24));
        llP.add(new Persona("Pepe", 20));
        System.out.println(llP.get(0).getNom() + " " + llP.get(0).getEdad() + " " + llP.size() + " " + llP.remove(0) + " " + llP.isEmpty());

        System.out.println("\nVector String:");
        Vector<String> vS = new Vector<String>();
        vS.add("cad1");
        vS.add("cad2");
        System.out.println(vS.get(0) + " " + vS.size() + " " + vS.contains("cad2") + " " + vS.remove(0) + " " + vS.isEmpty());
        System.out.println("\nVector Integer:");
        Vector<Integer> vI = new Vector<Integer>();
        vI.add(2);
        vI.add(4);
        System.out.println(vI.get(0) + " " + vI.size() + " " + vI.contains(6) + " " + vI.remove(0) + " " + vI.isEmpty());
        System.out.println("\nVector Persona:");
        Vector<Persona> vP = new Vector<Persona>();
        vP.add(new Persona("Jose", 24));
        vP.add(new Persona("Pepe", 20));
        System.out.println(vP.get(0).getNom() + " " + vP.get(0).getEdad() + " " + vP.size() + " " + vP.remove(0) + " " + vP.isEmpty());
        
    }
}
