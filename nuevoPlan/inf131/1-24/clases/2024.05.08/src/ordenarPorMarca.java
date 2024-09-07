import java.util.Comparator;

public class ordenarPorMarca implements Comparator<Laptop>{
    public int compare (Laptop l1, Laptop l2){
        return l1.getMarca().compareTo(l2.getMarca());
    }
}
