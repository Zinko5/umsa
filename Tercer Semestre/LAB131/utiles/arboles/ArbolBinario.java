
public class ArbolBinario {

    private Nodo raiz;

    ArbolBinario() {
        raiz = null;
    }

    public Nodo getRaiz() {
        return raiz;
    }

    public void setRaiz(Nodo raiz) {
        this.raiz = raiz;
    }

    public void crear(Nodo nodo) {
        if (nodo != null) {
            System.out.println("Datos Nombre, Dato"); //para indicar qué hay que introducir
            nodo.setNombre(Leer.dato());
            nodo.setDato(Leer.dato()); // leer los atributos del objeto

            System.out.println(nodo.getNombre() + " Tendra izq? s/n");
            String resp = Leer.dato();
            if (resp.equals("s")) {
                Nodo nueI = new Nodo();
                nodo.setIzq(nueI);
                crear(nodo.getIzq());
            }
            System.out.println(nodo.getNombre() + " Tendra der? s/n");
            resp = Leer.dato();
            if (resp.equals("s")) {
                Nodo nueD = new Nodo();
                nodo.setDer(nueD);
                crear(nodo.getDer());
            }
        }
    }

    //recursivos

    public void preorden(Nodo nodo)
    {
        if (nodo != null) {
            System.out.println(" <" + nodo.getNombre() + " " + nodo.getDato() + "> "); // mostrar los atributos
            preorden(nodo.getIzq());
            preorden(nodo.getDer());
        }
    }

    void inorden(Nodo nodo) {
        if (nodo != null) {
            inorden(nodo.getIzq());
            System.out.println(" <" + nodo.getNombre() + " " + nodo.getDato() + "> "); // mostrar los atributos
            inorden(nodo.getDer());
        }
    }

    void posorden(Nodo nodo) {
        if (nodo != null) {
            posorden(nodo.getIzq());
            posorden(nodo.getDer());
            System.out.println(" <" + nodo.getNombre() + " " + nodo.getDato() + "> "); // mostrar los atributos
        }
    }

    public int cantidad(Nodo r) {
        if (r != null) {
            return cantidad(r.getIzq()) + cantidad(r.getDer()) + 1;
        } else {
            return 0;
        }
    }

    //ejemplo de ejercicio
    public int contar(Nodo nodo) {
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
        setRaiz(new Nodo());
        System.out.println("DATOS "/*nombre de la clase del objeto */);
        //settear los atributos
        getRaiz().setNombre(Leer.dato());
        getRaiz().setDato(Leer.dato());
        nivel.adicionar(getRaiz());
        while (!nivel.esvacia()) {
            System.out.println("Nivel -----> " + c);
            while (!nivel.esvacia()) {
                Nodo r = nivel.eliminar();
                System.out.println(r.getNombre() + " Tendra descendiente izquierdo? s/n");
                String respuesta = Leer.dato();
                if (respuesta.equals("s")) {
                    Nodo nuevoNodo = new Nodo();
                    System.out.println("DATOS descendiente izquierdo");
                    //settear los atributos
                    getRaiz().setNombre(Leer.dato());
                    getRaiz().setDato(Leer.dato());
                    r.setIzq(nuevoNodo);
                    descendiente.adicionar(r.getIzq());
                }
                System.out.println(r.getNombre() + "Tendra descendiente derecho? s/n");
                respuesta = Leer.dato();
                if (respuesta.equals("s")) {
                    Nodo nueD = new Nodo();
                    System.out.println("DATOS descendiente derecho");
                    //settear los atributos
                    getRaiz().setNombre(Leer.dato());
                    getRaiz().setDato(Leer.dato());
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
        Nodo nodo;
        aux.adicionar(null);
        nodo = raiz;
        while (nodo != null) {
            if (nodo.getDer() != null) {
                aux.adicionar(nodo.getDer());
            }
            System.out.println(" <" + nodo.getNombre() + " " + nodo.getDato() + "> "); // mostrar los atributos
            if (nodo.getIzq() != null) {
                nodo = nodo.getIzq();
            } else {
                nodo = aux.eliminar();
            }
        }
    }

    //ejemplo ejercicio recursivo
    void completar(Nodo r) {
        if (r != null) {
            if (r.getIzq() != null && r.getDer() == null) {
                Nodo nue = new Nodo();
                /*System.out.print("Nombre-->");
                nue.setNombre(Leer.dato());
                System.out.print("Nota-->");
                nue.setNota(Leer.datoInt());*/
                nue.setNombre("Nombre Completado");
                nue.setDato("");

                r.setDer(nue);

            }
            if (r.getIzq() == null && r.getDer() != null) {
                Nodo nue = new Nodo();
                /*System.out.print("Nombre-->");
                nue.setNombre(Leer.dato());
                System.out.print("Nota-->");
                nue.setNota(Leer.datoInt());*/
                nue.setNombre("Nombre Completado");
                nue.setDato(""); 

                r.setIzq(nue);

            }

            completar(r.getIzq());
            completar(r.getDer());
        }
    }

    //ejemplo ejercicio iterativo
    void completar() {

        Nodo x;
        Pila nivel = new Pila();
        Pila desc = new Pila();

        nivel.adicionar(raiz);
        while (!nivel.esvacia()) {
            while (!nivel.esvacia()) {
                x = nivel.eliminar();

                if (x.getIzq() != null && x.getDer() == null) {
                    Nodo nue = new Nodo();
                    /*System.out.print("Nombre-->");
                    nue.setNombre(Leer.dato());
                    System.out.print("Nota-->");
                    nue.setNota(Leer.datoInt());*/
                    nue.setNombre("Nombre Completado");
                    nue.setDato("");
                    x.setDer(nue);

                }
                if (x.getIzq() == null && x.getDer() != null) {
                    Nodo nue = new Nodo();
                    /*System.out.print("Nombre-->");
                    nue.setNombre(Leer.dato());
                    System.out.print("Nota-->");
                    nue.setNota(Leer.datoInt());*/
                    nue.setNombre("Nombre Completado");
                    nue.setDato("");

                    x.setIzq(nue);

                }

                if (x.getIzq() != null) {
                    desc.adicionar(x.getIzq());
                }
                if (x.getDer() != null) {
                    desc.adicionar(x.getDer());
                }
            }

            nivel.vaciar(desc);
        }
    }
}
