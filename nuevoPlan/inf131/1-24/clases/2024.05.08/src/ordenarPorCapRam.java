import java.util.Comparator;

public class ordenarPorCapRam implements Comparator<Laptop>{
    public int compare (Laptop l1, Laptop l2){
        return Integer.compare(l1.getCapRam(), l2.getCapRam());
    }
}
