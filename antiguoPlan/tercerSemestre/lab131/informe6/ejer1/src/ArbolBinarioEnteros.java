public class ArbolBinarioEnteros {

    private NodoEnteros raiz;

    ArbolBinarioEnteros() {
        raiz = null;
    }

    public NodoEnteros getRaiz() {
        return raiz;
    }

    public void setRaiz(NodoEnteros raiz) {
        this.raiz = raiz;
    }

    public void crear(NodoEnteros nodo) {
        if (nodo != null) {
            System.out.println("Datos Entero"); //para indicar qué hay que introducir
            nodo.setEntero(Leer.datoInt());

            System.out.println(nodo.getEntero() + " Tendra izq? s/n");
            String resp = Leer.dato();
            if (resp.equals("s")) {
                NodoEnteros nueI = new NodoEnteros();
                nodo.setIzq(nueI);
                crear(nodo.getIzq());
            }
            System.out.println(nodo.getEntero() + " Tendra der? s/n");
            resp = Leer.dato();
            if (resp.equals("s")) {
                NodoEnteros nueD = new NodoEnteros();
                nodo.setDer(nueD);
                crear(nodo.getDer());
            }
        }
    }

    //recursivos

    public void preorden(NodoEnteros nodo)
    {
        if (nodo != null) {
            System.out.println(" <" + nodo.getEntero() + "> "); // mostrar los atributos
            preorden(nodo.getIzq());
            preorden(nodo.getDer());
        }
    }

    void inorden(NodoEnteros nodo) {
        if (nodo != null) {
            inorden(nodo.getIzq());
            System.out.println(" <" + nodo.getEntero() + "> "); // mostrar los atributos
            inorden(nodo.getDer());
        }
    }

    void posorden(NodoEnteros nodo) {
        if (nodo != null) {
            posorden(nodo.getIzq());
            posorden(nodo.getDer());
            System.out.println(" <" + nodo.getEntero() + "> "); // mostrar los atributos
        }
    }

    public int cantidad(NodoEnteros r) {
        if (r != null) {
            return cantidad(r.getIzq()) + cantidad(r.getDer()) + 1;
        } else {
            return 0;
        }
    }

    //ejemplo de ejercicio
    public int contar(NodoEnteros nodo) {
        if (nodo != null) {
            int c = contar(nodo.getIzq()) + contar(nodo.getDer());
                c++;
            return c;
        } else {
            return 0;
        }
    }

    //iterativos
    public void crear() {
        int c = 0;
        Pila nivel = new Pila();
        Pila descendiente = new Pila();
        setRaiz(new NodoEnteros());
        System.out.println("DATOS "/*nombre de la clase del objeto */);
        //settear los atributos
        getRaiz().setEntero(Leer.datoInt());
        nivel.adicionar(getRaiz());
        while (!nivel.esvacia()) {
            System.out.println("Nivel -----> " + c);
            while (!nivel.esvacia()) {
                NodoEnteros r = nivel.eliminar();
                System.out.println(r.getEntero() + " Tendra descendiente izquierdo? s/n");
                String respuesta = Leer.dato();
                if (respuesta.equals("s")) {
                    NodoEnteros nuevoNodo = new NodoEnteros();
                    System.out.println("DATOS descendiente izquierdo");
                    //settear los atributos
                    getRaiz().setEntero(Leer.datoInt());
                    r.setIzq(nuevoNodo);
                    descendiente.adicionar(r.getIzq());
                }
                System.out.println(r.getEntero() + "Tendra descendiente derecho? s/n");
                respuesta = Leer.dato();
                if (respuesta.equals("s")) {
                    NodoEnteros nueD = new NodoEnteros();
                    System.out.println("DATOS descendiente derecho");
                    //settear los atributos
                    getRaiz().setEntero(Leer.datoInt());
                    r.setDer(nueD);
                    descendiente.adicionar(r.getDer());
                }
            }
            nivel.vaciar(descendiente);//pasar nivel
            c++;
        }
    }

    void preorden() {
        Pila aux = new Pila();
        NodoEnteros nodo;
        aux.adicionar(null);
        nodo = raiz;
        while (nodo != null) {
            if (nodo.getDer() != null) {
                aux.adicionar(nodo.getDer());
            }
            System.out.println(" <" + nodo.getEntero() + "> "); // mostrar los atributos
            if (nodo.getIzq() != null) {
                nodo = nodo.getIzq();
            } else {
                nodo = aux.eliminar();
            }
        }
    }

    public void podarHojas(NodoEnteros nodo) {
        if (nodo != null) {
            if (nodo.getIzq() != null && nodo.getIzq().esHoja()) {
                nodo.setIzq(null);
            }
            if (nodo.getDer() != null && nodo.getDer().esHoja()) {
                nodo.setDer(null);
            }
            podarHojas(nodo.getIzq());
            podarHojas(nodo.getDer());
        }
    }
    
}
