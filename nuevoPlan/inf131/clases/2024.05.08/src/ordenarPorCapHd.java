import java.util.Comparator;

public class ordenarPorCapHd implements Comparator<Laptop>{
    public int compare (Laptop l1, Laptop l2){
        return Integer.compare(l1.getCapHd(), l2.getCapHd());
    }
}
