import java.util.LinkedList;

public class linkedlist {
    public static void main(String[] args) {
        LinkedList<celular> listaCel1 = new LinkedList<celular>();
        System.out.println("Callisaya Rodriguez Diana    CI:10900296");
        celular cel1 = new celular("Samsung", 1200, "AD00");
        celular cel2 = new celular("Lenovo", 432400, "3fdsfO");
        celular cel3 = new celular("Samsung", 324000, "asdd3");
        listaCel1.add(cel1);
        listaCel1.add(cel2);
        listaCel1.add(cel3);
        listaCel1.add(1, cel3);
        listaCel1.remove(0);
        listaCel1.remove(cel2);
        System.out.println(listaCel1.size());
        listaCel1.contains(cel1);
        System.out.println(listaCel1.get(1));
        listaCel1.clear();
        listaCel1.isEmpty();
    }
}
