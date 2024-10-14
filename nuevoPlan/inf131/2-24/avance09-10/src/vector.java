import java.util.Vector;

public class vector {
    public static void main(String[] args) {
        System.out.println("Callisaya Rodriguez Diana    CI:10900296");
        celular cel1 = new celular("Samsung", 1200, "AD00");
        celular cel2 = new celular("Lenovo", 432400, "3fdsfO");
        celular cel3 = new celular("Samsung", 324000, "asdd3");
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
