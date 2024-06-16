import java.util.HashSet;
import java.util.Iterator;
import java.util.TreeSet;
import java.util.TreeMap;
import java.util.HashMap;
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("\nGabriel Marcelo Muñoz Callisaya CI: 9873103");
        System.out.println("\nHashSet Integer:");
        HashSet<Integer> hsi = new HashSet<Integer>();
        hsi.add(2);
        hsi.add(4);
        System.out.println(hsi + " " + hsi.size() + " " + hsi.contains(6) + " " + hsi.remove(0) + " " + hsi.isEmpty());
        System.out.println("\nHashSet Persona:");
        HashSet<Persona> hso = new HashSet<Persona>();
        hso.add(new Persona("Jose", 24));
        hso.add(new Persona("Pepe", 20));
        System.out.println(hso + " " + hso.size() + " " + hso.contains(6) + " " + hso.remove(0) + " " + hso.isEmpty());

        System.out.println("\nTreeSet Integer:");
        TreeSet<Integer> llI = new TreeSet<Integer>();
        llI.add(2);
        llI.add(4);
        System.out.println(llI + " " + llI.size() + " " + llI.contains(6) + " " + llI.remove(0) + " " + llI.isEmpty());
        System.out.println("\nTreeSet Persona:");
        TreeSet<Persona> llP = new TreeSet<Persona>();
        llP.add(new Persona("Jose", 24));
        llP.add(new Persona("Pepe", 20));
        System.out.println(llP + " " + llP.size() + " " + " " + llP.isEmpty());

        System.out.println("\nHashMap Integer:");
        HashMap<Integer, Integer> vI = new HashMap<Integer, Integer>();
        vI.put(0, 5);
        vI.put(1, 4);
        System.out.println(vI.get(0) + " " + vI.size() + " " + vI.remove(0) + " " + vI.isEmpty());
        System.out.println("\nHashMap Persona:");
        HashMap<Integer, Persona> vP = new HashMap<Integer, Persona>();
        vP.put(1, new Persona("Jose", 24));
        vP.put(0, new Persona("Pepe", 20));
        System.out.println(vP.get(0).getNom() + " " + vP.get(0).getEdad() + " " + vP.size() + " " + vP.remove(0) + " " + vP.isEmpty());

        System.out.println("\nTreeMap Integer:");
        TreeMap<Integer, Integer> ti = new TreeMap<Integer, Integer>();
        ti.put(0, 5);
        ti.put(1, 4);
        System.out.println(ti.get(0) + " " + ti.size() + " " + ti.remove(0) + " " + ti.isEmpty());
        System.out.println("\nTreeMap Persona:");
        TreeMap<Integer, Persona> tp = new TreeMap<Integer, Persona>();
        tp.put(1, new Persona("Jose", 24));
        tp.put(0, new Persona("Pepe", 20));
        System.out.println(tp.get(0).getNom() + " " + tp.get(0).getEdad() + " " + tp.size() + " " + tp.remove(0) + " " + tp.isEmpty());
    }
}
