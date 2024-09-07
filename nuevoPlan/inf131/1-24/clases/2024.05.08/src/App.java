/* import java.util.LinkedList; */
import java.util.Collections;
import java.util.Stack;

public class App {
    public static void main(String[] args) throws Exception {
        /* Stack<Estudiante> pilae = new Stack<Estudiante>();
        pilae.push(new Estudiante("Carlos", 26));
        pilae.push(new Estudiante("Diego", 22));
        pilae.push(new Estudiante("Joaquin", 21));
        pilae.push(new Estudiante("Jorge", 25));
        pilae.push(new Estudiante("Pepe", 23));
        System.out.println(pilae);
        pilae.sort();
        System.out.println(pilae); */

        Stack<Laptop> listaLaptop = new Stack<Laptop>();
        listaLaptop.push(new Laptop("HP", 180, 16, 12000));
        listaLaptop.push(new Laptop("Lenovo", 300, 12, 15000));
        listaLaptop.push(new Laptop("Samsung", 120, 16, 11000));
        listaLaptop.push(new Laptop("Apple", 80, 8, 22000));
        listaLaptop.push(new Laptop("Asus", 500, 32, 18000));
        System.out.println("Lista original:\n" + listaLaptop);
        Collections.sort(listaLaptop, new ordenarPorMarca());
        System.out.println("Ordenada por Marca:\n" + listaLaptop);
        Collections.sort(listaLaptop, new ordenarPorCapHd());
        System.out.println("Ordenada por capHd:\n" + listaLaptop);
        Collections.sort(listaLaptop, new ordenarPorCapRam());
        System.out.println("Ordenada por capRam:\n" + listaLaptop);
        Collections.sort(listaLaptop, new ordenarPorPrecio());
        System.out.println("Ordenada por precio:\n" + listaLaptop);
        listaLaptop.sort(null);
        System.out.println("Ordenada por precio 2 :\n" + listaLaptop);
    }
}
