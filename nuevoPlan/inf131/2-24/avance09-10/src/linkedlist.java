import java.util.LinkedList;

public class linkedlist {
    public static void main(String[] args) {
        System.out.println("Muñoz Callisaya Gabriel Marcelo     CI:9873103");
        LinkedList<celular> listaCel1 = new LinkedList<celular>();
        celular cel1 = new celular("nokia", 3500, "AXC300");
        celular cel2 = new celular("iPhone", 10000, "3kPOO");
        celular cel3 = new celular("Samsung", 5000, "XCT3");
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
