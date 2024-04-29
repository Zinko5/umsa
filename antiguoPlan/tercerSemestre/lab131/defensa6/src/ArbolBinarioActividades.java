public class ArbolBinarioActividades {

    private NodoActividades raiz;

    ArbolBinarioActividades() {
        raiz = null;
    }

    public NodoActividades getRaiz() {
        return raiz;
    }

    public void setRaiz(NodoActividades raiz) {
        this.raiz = raiz;
    }

    public void crear(NodoActividades nodo) {
        if (nodo != null) {
            System.out.println("Datos: fecha dd/mm/aaaa, actividad"); //para indicar qué hay que introducir
            nodo.setFecha(Leer.dato());
            nodo.setActividad(Leer.dato()); // leer los atributos del objeto

            System.out.println(nodo.getFecha()+ " Tendra izq? s/n");
            String resp = Leer.dato();
            if (resp.equals("s")) {
                NodoActividades nueI = new NodoActividades();
                nodo.setIzq(nueI);
                crear(nodo.getIzq());
            }
            System.out.println(nodo.getFecha()+ " Tendra der? s/n");
            resp = Leer.dato();
            if (resp.equals("s")) {
                NodoActividades nueD = new NodoActividades();
                nodo.setDer(nueD);
                crear(nodo.getDer());
            }
        }
    }

    //recursivos

    public void preorden(NodoActividades nodo)
    {
        if (nodo != null) {
            System.out.println(" <" + nodo.getFecha() + " " + nodo.getActividad()+ "> "); // mostrar los atributos
            preorden(nodo.getIzq());
            preorden(nodo.getDer());
        }
    }

    void inorden(NodoActividades nodo) {
        if (nodo != null) {
            inorden(nodo.getIzq());
            System.out.println(" <" + nodo.getFecha() + " " + nodo.getActividad()+ "> "); // mostrar los atributos
            inorden(nodo.getDer());
        }
    }

    void posorden(NodoActividades nodo) {
        if (nodo != null) {
            posorden(nodo.getIzq());
            posorden(nodo.getDer());
            System.out.println(" <" + nodo.getFecha() + " " + nodo.getActividad()+ "> "); // mostrar los atributos
        }
    }

    public int cantidad(NodoActividades r) {
        if (r != null) {
            return cantidad(r.getIzq()) + cantidad(r.getDer()) + 1;
        } else {
            return 0;
        }
    }

    //ejemplo de ejercicio
    public int contar(NodoActividades nodo) {
        if (nodo != null) {
            int c = contar(nodo.getIzq()) + contar(nodo.getDer());
            c++;
            return c;
        } else {
            return 0;
        }
    }

    public int contar(NodoActividades nodo, String x) {
        if (nodo != null) {
            int c = contar(nodo.getIzq()) + contar(nodo.getDer());
            if (nodo.getDia().equals(x)) {
                c ++;
            }
            return c;
        } else {
            return 0;
        }
    }
   
    public void masActividades (NodoActividades nodo, String x) {
        int izq = contar(nodo.getIzq(), x);
        int der = contar(nodo.getDer(), x);
        if (izq == der) {
            System.out.println("Ambos subarboles tienen la misma cantidad de actividades el dia x");
        }
        else {
            if (izq > der) {
            System.out.println("El subarbol izquierdo tiene más actividades el día " + x);
            } else {
                System.out.println("El subarbol derecho tiene más actividades el día " + x);
            }
        }
    }
    
    public int contarMismoMesIzq(NodoActividades nodo) {
        if (nodo != null) {
            int c = contarMismoMesIzq(nodo.getIzq()) + contarMismoMesIzq(nodo.getDer());
            if (nodo.getIzq() != null) {
                if (nodo.getMes().equals(nodo.getIzq().getMes())) {
                    c ++;
                }
            }
            return c;
        } else {
            return 0;
        }
    }
    
    //iterativos
    public void crear() {
        int c = 0;
        PilaActividades niv = new PilaActividades();
        PilaActividades desc = new PilaActividades();
        setRaiz(new NodoActividades());
        System.out.println("DATOS actividad, fecha");
        getRaiz().setActividad(Leer.dato());
        getRaiz().setFecha(Leer.dato());        
        niv.adicionar(getRaiz());
        while (!niv.esvacia()) {
            System.out.println("Nivel -----> " + c);
            while (!niv.esvacia()) {
                NodoActividades r = niv.eliminar();
                System.out.println(r.getActividad()+ " Tendra izquierda? s/n");
                String resp = Leer.dato();
                if (resp.equals("s")) {
                    NodoActividades nueI = new NodoActividades();
                    System.out.println("DATOS actividad, fecha izquierdo");
                    nueI.setActividad(Leer.dato());
                    nueI.setFecha(Leer.dato());
                    r.setIzq(nueI);
                    desc.adicionar(r.getIzq());
                }
                System.out.println(r.getActividad() + " Tendra derecha? s/n");
                resp = Leer.dato();
                if (resp.equals("s")) {
                    NodoActividades nueD = new NodoActividades();
                    System.out.println("DATOS actividad, fecha derecho");
                    nueD.setActividad(Leer.dato());
                    nueD.setFecha(Leer.dato());
                    r.setDer(nueD);
                    desc.adicionar(r.getDer());
                }
            }
            niv.vaciar(desc);//pasar nivel
            c++;
        }
    }

    void preorden() {
        PilaActividades aux = new PilaActividades();
        NodoActividades nodo;
        aux.adicionar(null);
        nodo = raiz;
        while (nodo != null) {
            if (nodo.getDer() != null) {
                aux.adicionar(nodo.getDer());
            }
            System.out.println(" <" + nodo.getFecha() + " " + nodo.getActividad()+ "> "); // mostrar los atributos
            if (nodo.getIzq() != null) {
                nodo = nodo.getIzq();
            } else {
                nodo = aux.eliminar();
            }
        }
    }

    //ejemplo ejercicio recursivo
    void completar(NodoActividades r) {
        if (r != null) {
            if (r.getIzq() != null && r.getDer() == null) {
                NodoActividades nue = new NodoActividades();
                /*System.out.print("Nombre-->");
                nue.setNombre(Leer.dato());
                System.out.print("Nota-->");
                nue.setNota(Leer.datoInt());*/
                nue.setFecha("FECHA Completado");
                nue.setActividad("");

                r.setDer(nue);

            }
            if (r.getIzq() == null && r.getDer() != null) {
                NodoActividades nue = new NodoActividades();
                /*System.out.print("Nombre-->");
                nue.setNombre(Leer.dato());
                System.out.print("Nota-->");
                nue.setNota(Leer.datoInt());*/
                nue.setFecha("FECHA Completado");
                nue.setActividad("");

                r.setIzq(nue);

            }

            completar(r.getIzq());
            completar(r.getDer());
        }
    }
    
    
    //ejemplo ejercicio iterativo
    void completar() {

        NodoActividades x;
        PilaActividades nivel = new PilaActividades();
        PilaActividades desc = new PilaActividades();

        nivel.adicionar(raiz);
        while (!nivel.esvacia()) {
            while (!nivel.esvacia()) {
                x = nivel.eliminar();

                if (x.getIzq() != null && x.getDer() == null) {
                    NodoActividades nue = new NodoActividades();
                    /*System.out.print("Nombre-->");
                    nue.setNombre(Leer.dato());
                    System.out.print("Nota-->");
                    nue.setNota(Leer.datoInt());*/
                    nue.setFecha("Nombre Completado");
                    nue.setActividad("");
                    x.setDer(nue);

                }
                if (x.getIzq() == null && x.getDer() != null) {
                    NodoActividades nue = new NodoActividades();
                    /*System.out.print("Nombre-->");
                    nue.setNombre(Leer.dato());
                    System.out.print("Nota-->");
                    nue.setNota(Leer.datoInt());*/
                    nue.setFecha("Nombre Completado");
                    nue.setActividad("");

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
