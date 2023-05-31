
public class ArbolBinarioEstudiantes {

    private NodoEstudiantes raiz;

    ArbolBinarioEstudiantes() {
        raiz = null;
    }

    public NodoEstudiantes getRaiz() {
        return raiz;
    }

    public void setRaiz(NodoEstudiantes raiz) {
        this.raiz = raiz;
    }

    //recursivos
    public void crear(NodoEstudiantes r) {
        if (r != null) {
            System.out.println("Datos Nombre, Nota");
            r.setNombre(Leer.dato());
            r.setNota(Leer.datoInt());

            System.out.println(r.getNombre() + " Tendra izq? s/n");
            String resp = Leer.dato();
            if (resp.equals("s")) {
                NodoEstudiantes nueI = new NodoEstudiantes();
                r.setIzq(nueI);
                crear(r.getIzq());
            }
            System.out.println(r.getNombre() + " Tendra der? s/n");
            resp = Leer.dato();
            if (resp.equals("s")) {
                NodoEstudiantes nueD = new NodoEstudiantes();
                r.setDer(nueD);
                crear(r.getDer());
            }
        }
    }

    public void preorden(NodoEstudiantes r)//Rid
    {
        if (r != null) {
            System.out.println(" <" + r.getNombre() + " " + r.getNota() + "> ");
            preorden(r.getIzq());
            preorden(r.getDer());
        }
    }

    void inorden(NodoEstudiantes r) {
        if (r != null) {
            inorden(r.getIzq());
            System.out.println(" <" + r.getNombre() + " " + r.getNota() + "> ");
            inorden(r.getDer());
        }
    }

    void posorden(NodoEstudiantes r) {
        if (r != null) {
            posorden(r.getIzq());
            posorden(r.getDer());
            System.out.println(" <" + r.getNombre() + " " + r.getNota() + "> ");
        }
    }

    public int cantidad(NodoEstudiantes r) {
        if (r != null) {
            return cantidad(r.getIzq()) + cantidad(r.getDer()) + 1;
        } else {
            return 0;
        }
    }

    public int contar(NodoEstudiantes r) {
        if (r != null) {
            int c = contar(r.getIzq()) + contar(r.getDer());
            if (r.getNota() >= 51) {
                c++;
            }
            return c;
        } else {
            return 0;
        }
    }

    //iterativos
    public void crear() {
        int c = 0;
        Pila niv = new Pila();
        Pila desc = new Pila();
        setRaiz(new NodoEstudiantes());
        System.out.println("DATOS Estudiante");
        getRaiz().setNombre(Leer.dato());
        getRaiz().setNota(Leer.datoInt());
        niv.adicionar(getRaiz());
        while (!niv.esvacia()) {
            System.out.println("Nivel -----> " + c);
            while (!niv.esvacia()) {
                NodoEstudiantes r = niv.eliminar();
                System.out.println(r.getNombre() + " Tendra izq? s/n");
                String resp = Leer.dato();
                if (resp.equals("s")) {
                    NodoEstudiantes nueI = new NodoEstudiantes();
                    System.out.println("DATOS Estudiante desc. Izq");
                    nueI.setNombre(Leer.dato());
                    nueI.setNota(Leer.datoInt());
                    r.setIzq(nueI);
                    desc.adicionar(r.getIzq());
                }
                System.out.println(r.getNombre() + "Tendra der? s/n");
                resp = Leer.dato();
                if (resp.equals("s")) {
                    NodoEstudiantes nueD = new NodoEstudiantes();
                    System.out.println("DATOS Estudiante desc. Der");
                    nueD.setNombre(Leer.dato());
                    nueD.setNota(Leer.datoInt());
                    r.setDer(nueD);
                    desc.adicionar(r.getDer());
                }
            }
            niv.vaciar(desc);//pasar nivel
            c++;
        }
    }

    void preorden() {
        Pila aux = new Pila();
        NodoEstudiantes x;
        aux.adicionar(null);
        x = raiz;
        while (x != null) {
            if (x.getDer() != null) {
                aux.adicionar(x.getDer());
            }
            System.out.println("<" + x.getNombre() + " " + x.getNota() + "> ");
            if (x.getIzq() != null) {
                x = x.getIzq();
            } else {
                x = aux.eliminar();
            }
        }
    }

    void completar(NodoEstudiantes r) {
        if (r != null) {
            if (r.getIzq() != null && r.getDer() == null) {
                NodoEstudiantes nue = new NodoEstudiantes();
                /*System.out.print("Nombre-->");
                nue.setNombre(Leer.dato());
                System.out.print("Nota-->");
                nue.setNota(Leer.datoInt());*/
                nue.setNombre("Nombre Completado");
                nue.setNota(0);

                r.setDer(nue);

            }
            if (r.getIzq() == null && r.getDer() != null) {
                NodoEstudiantes nue = new NodoEstudiantes();
                /*System.out.print("Nombre-->");
                nue.setNombre(Leer.dato());
                System.out.print("Nota-->");
                nue.setNota(Leer.datoInt());*/
                nue.setNombre("Nombre Completado");
                nue.setNota(0);

                r.setIzq(nue);

            }

            completar(r.getIzq());
            completar(r.getDer());
        }
    }

    void completar() {

        NodoEstudiantes x;
        Pila nivel = new Pila();
        Pila desc = new Pila();

        nivel.adicionar(raiz);
        while (!nivel.esvacia()) {
            while (!nivel.esvacia()) {
                x = nivel.eliminar();

                if (x.getIzq() != null && x.getDer() == null) {
                    NodoEstudiantes nue = new NodoEstudiantes();
                    /*System.out.print("Nombre-->");
                    nue.setNombre(Leer.dato());
                    System.out.print("Nota-->");
                    nue.setNota(Leer.datoInt());*/
                    nue.setNombre("Nombre Completado");
                    nue.setNota(0);
                    x.setDer(nue);

                }
                if (x.getIzq() == null && x.getDer() != null) {
                    NodoEstudiantes nue = new NodoEstudiantes();
                    /*System.out.print("Nombre-->");
                    nue.setNombre(Leer.dato());
                    System.out.print("Nota-->");
                    nue.setNota(Leer.datoInt());*/
                    nue.setNombre("Nombre Completado");
                    nue.setNota(0);

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

    /*
    public void niveles()
    {
        PilaNZ niv=new PilaNZ();
        PilaNZ desc=new PilaNZ();
        niv.adicion(getRaiz());
        int c=0;
        while(!niv.esvacia())
        {
            System.out.print("\nNivel : "+c);
            while(!niv.esvacia())
            {
                Nodo r=niv.eliminacion();
                System.out.print(" <"+r.getNomZ()+" "+r.getMacro()+" "+r.getDist()+" "+r.getNroHab()+"> ");
                if(r.getIzq()!=null)
                    desc.adicion(r.getIzq());
                if(r.getDer()!=null)
                    desc.adicion(r.getDer());
            }
            niv.vaciar(desc);
           c++;
        }
    }
    public void completar()
    {
        PilaNZ niv=new PilaNZ();
        PilaNZ desc=new PilaNZ();
        niv.adicion(getRaiz());
        while(!niv.esvacia())
        {
            while(!niv.esvacia())
            {
                Nodo r=niv.eliminacion();
                if(r.getIzq()!=null && r.getDer()==null)
                {
                    Nodo nue=new Nodo();
                    nue.setNomZ("zx");nue.setMacro("mx");nue.setDist(0);nue.setNroHab(0);
                    r.setDer(nue);
                }
                if(r.getIzq()==null && r.getDer()!=null)
                {
                    Nodo nue=new Nodo();
                    nue.setNomZ("zx");nue.setMacro("mx");nue.setDist(0);nue.setNroHab(0);
                    r.setIzq(nue);
                }
                if(r.getIzq()!=null)
                    desc.adicion(r.getIzq());
                if(r.getDer()!=null)
                    desc.adicion(r.getDer());
            }
            niv.vaciar(desc);
        }
    }
    public void busca(String x)
    {
        PilaNZ niv=new PilaNZ();
        PilaNZ desc=new PilaNZ();
        niv.adicion(getRaiz());
        while(!niv.esvacia())
        {
            while(!niv.esvacia())
            {
                Nodo r=niv.eliminacion();
                if(r.getNomZ().equals(x))
                    subarbol(r);  
                if(r.getIzq()!=null)
                    desc.adicion(r.getIzq());
                if(r.getDer()!=null)
                    desc.adicion(r.getDer());
            }
            niv.vaciar(desc);
        }
    }
    public void subarbol(Nodo q)
    {
        PilaNZ niv=new PilaNZ();
        PilaNZ desc=new PilaNZ();
        niv.adicion(q);
        while(!niv.esvacia())
        {
            while(!niv.esvacia())
            {
                Nodo r=niv.eliminacion();
                System.out.print(" <"+r.getNomZ()+" "+r.getMacro()+" "+r.getDist()+" "+r.getNroHab()+"> ");
                if(r.getIzq()!=null)
                    desc.adicion(r.getIzq());
                if(r.getDer()!=null)
                    desc.adicion(r.getDer());
            }
            niv.vaciar(desc);
            System.out.println("");
        }
    }*/
}
