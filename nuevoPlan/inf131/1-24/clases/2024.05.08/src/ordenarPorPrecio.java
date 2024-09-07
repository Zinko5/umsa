import java.util.Comparator;

public class ordenarPorPrecio implements Comparator<Laptop>{
    public int compare (Laptop l1, Laptop l2){
        return Integer.compare(l1.getPrecio(), l2.getPrecio());
    }
}
