import java.util.Stack;
import java.util.PriorityQueue;
import java.util.Queue;

public class App {
    public static void main(String[] args) throws Exception {
        Pila pila = new Pila();
        objeto objeto = new objeto();
        pila.adicionar(objeto);
        // uso Stack
        Stack<objeto> stack = new Stack<objeto>();
        stack.push(objeto);
        objeto = stack.pop();
        // uso queue
        Queue<objeto> queue = new PriorityQueue<objeto>();
        queue.add(objeto);
        queue.remove();

    }
    //pila
    public static void Pila(Pila pila) {
        Pila pilaAux = new Pila();
        while (!pila.esvacia()) {
            objeto objetoSacado = pila.eliminar();
            //cosas del problema
            pilaAux.adicionar(objetoSacado);
        }
        pila.vaciar(pilaAux);
    }
}
