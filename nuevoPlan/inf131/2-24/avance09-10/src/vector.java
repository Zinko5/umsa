import java.util.Vector;

public class vector {
    public static void main(String[] args) {
        System.out.println("Muñoz Callisaya Gabriel Marcelo     CI:9873103");
        celular cel1 = new celular("nokia", 3500, "AXC300");
        celular cel2 = new celular("iPhone", 10000, "3kPOO");
        celular cel3 = new celular("Samsung", 5000, "XCT3");
        Vector<celular> vecCel = new Vector<celular>();
        vecCel.add(cel1);
        vecCel.add(cel2);
        vecCel.add(cel3);
        vecCel.add(1, cel2);
        vecCel.remove(0);
        vecCel.remove(cel2);
        System.out.println(vecCel.size());
        vecCel.contains(cel3);
        System.out.println(vecCel.get(1));
        vecCel.clear();
        vecCel.isEmpty();
    }
}
