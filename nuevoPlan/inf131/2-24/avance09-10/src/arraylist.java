import java.util.ArrayList;

public class arraylist {
    public static void main(String[] args) throws Exception {
        System.out.println("Callisaya Rodriguez Diana    CI:10900296");
        celular cel1 = new celular("Samsung", 1200, "AD00");
        celular cel2 = new celular("Lenovo", 432400, "3fdsfO");
        celular cel3 = new celular("Samsung", 324000, "asdd3");
        ArrayList<celular> arrayCel = new ArrayList<celular>();
        arrayCel.add(cel1);
        arrayCel.add(1, cel2);
        arrayCel.get(1);
        arrayCel.size();
        arrayCel.contains(cel1);
        arrayCel.indexOf(cel1);
        arrayCel.lastIndexOf(cel1);
        arrayCel.remove(1);
        arrayCel.remove(cel3);
        arrayCel.clear();
        arrayCel.isEmpty();
        ArrayList copia = (ArrayList) arrayCel.clone();
        Object[] array = arrayCel.toArray();
    }
}
