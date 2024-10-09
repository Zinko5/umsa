import java.util.ArrayList;

public class arraylist {
    public static void main(String[] args) throws Exception {
        //utilizar arraylist, linkedlist, vector 
        //para manejar objetos de celular<marca, precio, modelo>
        System.out.println("Muñoz Callisaya Gabriel Marcelo     CI:9873103");
        ArrayList<celular> arrayCel = new ArrayList<celular>();
        celular cel1 = new celular("nokia", 3500, "AXC300");
        celular cel2 = new celular("iPhone", 10000, "3kPOO");
        celular cel3 = new celular("Samsung", 5000, "XCT3");
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
