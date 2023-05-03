public class App {
    public static void main(String[] args) {
        PilaMunicipìos pm = new PilaMunicipìos();
        Municipio m = new Municipio(5, "Cercado");
        Municipio m1 = new Municipio(12, "Viacha");
        Municipio m2 = new Municipio(2, "La Paz");
        Municipio m3 = new Municipio(15, "El Alto");
        Municipio m4 = new Municipio(11, "ATM");
        Municipio m5 = new Municipio(10, "Municipio 1");
        pm.adicionar(m);
        pm.adicionar(m1);
        pm.adicionar(m2);
        pm.adicionar(m3);
        pm.adicionar(m4);
        pm.adicionar(m5);
        ColaSimpleComunidades cc = new ColaSimpleComunidades();
        Comunidad c = new Comunidad(1, 12, "ABC");
        Comunidad c1 = new Comunidad(4, 11, "Comunidad 1");
        Comunidad c2 = new Comunidad(2, 5, "Comunidad 2");
        Comunidad c3 = new Comunidad(18, 10, "Comunidad 3");
        Comunidad c4 = new Comunidad(22, 2, "Comunidad 4");
        Comunidad c5 = new Comunidad(51, 15, "Comunidad 5");
        cc.adicionar(c);
        cc.adicionar(c1);
        cc.adicionar(c2);
        cc.adicionar(c3);
        cc.adicionar(c4);
        cc.adicionar(c5);
        ColaSimpleAgropecuarias ca = new ColaSimpleAgropecuarias();
        FeriaAgro fa = new FeriaAgro("15/02/21", "Calle 12", "Segunda version");
        FeriaAgro fa1 = new FeriaAgro("19/12/23", "Calle 10", "Primera version");
        FeriaAgro fa2 = new FeriaAgro("25/10/19", "Calle 2", "Segunda version");
        FeriaAgro fa3 = new FeriaAgro("10/09/22", "Calle 15", "Cuarta version");
        ca.adicionar(fa);
        ca.adicionar(fa1);
        ca.adicionar(fa2);
        ca.adicionar(fa3);
        //1
        pm.mostrar();
        //2
        cc.mostrar();
        //3
        ca.mostrar();
        //stand 1
        Producto p = new Producto("Manzana", "Fruta", 6, 30);
        Producto p1 = new Producto("Lechuga", "Verdura", 2, 16);
        PilaProductos pp = new PilaProductos();
        pp.adicionar(p);
        pp.adicionar(p1);
        Stand s = new Stand(1, 51, "Pepe", pp);
        //stand 2
        Producto p2 = new Producto("Banana", "Fruta", 5, 20);
        Producto p3 = new Producto("Tomate", "Verdura", 10, 14);
        PilaProductos pp1 = new PilaProductos();
        pp1.adicionar(p2);
        pp1.adicionar(p3);
        Stand s1 = new Stand(1, 20, "Jorge", pp1);
        //stand 3
        Producto p4 = new Producto("Sandia", "Fruta", 11, 10);
        Producto p5 = new Producto("Pepino", "Verdura", 5, 21);
        PilaProductos pp2 = new PilaProductos();
        pp2.adicionar(p4);
        pp2.adicionar(p5);
        Stand s2 = new Stand(1, 10, "Trump", pp2);
        //stand 4
        Producto p6 = new Producto("Banana", "Fruta", 2, 12);
        Producto p7 = new Producto("Zapallo", "Verdura", 6, 15);
        PilaProductos pp3 = new PilaProductos();
        pp3.adicionar(p6);
        pp3.adicionar(p7);
        Stand s3 = new Stand(1, 15, "Jan", pp3);
        //stand 5
        Producto p8 = new Producto("Zapatos", "Ropa", 12, 8);
        PilaProductos pp4 = new PilaProductos();
        pp4.adicionar(p8);
        Stand s4 = new Stand(2, 15, "Stefan", pp4);
        //stand 6
        Producto p9 = new Producto("Gorra", "Ropa", 11, 18);
        PilaProductos pp5 = new PilaProductos();
        pp4.adicionar(p9);
        Stand s5 = new Stand(2, 15, "Angel", pp5);
        //stand 7
        Producto p10 = new Producto("Chompa", "Ropa", 12, 20);
        PilaProductos pp6 = new PilaProductos();
        pp6.adicionar(p10);
        Stand s6 = new Stand(2, 15, "Alvaro", pp6);
        //stand 8
        Producto p11 = new Producto("Calcetines", "Ropa", 5, 5);
        PilaProductos pp7 = new PilaProductos();
        pp7.adicionar(p11);
        Stand s7 = new Stand(2, 15, "Joao", pp7);
        //Multicola de stands
        MultiColaStands mcs = new MultiColaStands();
        mcs.setN(4);
        mcs.adicionar(1, s);
        mcs.adicionar(2, s1);
        mcs.adicionar(3, s2);
        mcs.adicionar(4, s3);
        mcs.adicionar(1, s4);
        mcs.adicionar(2, s5);
        mcs.adicionar(3, s6);
        mcs.adicionar(4, s7);
        mcs.mostrar();
        mostrar(mcs, ca, "25/10/19", 10);
    }
    static public void mostrar(MultiColaStands mlticolastnd, ColaSimpleAgropecuarias colasimpagro, String x, int y) {
        int itr = colasimpagro.nroelem() + 1;
        for (int i = 1; i < itr; i++) {
            FeriaAgro feragrosacada = colasimpagro.eliminar();
            if (feragrosacada.getFecha().equals(x)) {
                int jtr = mlticolastnd.nroElem(i) + 1;
                for (int j = 1; j < jtr; j++) {
                    Stand standsacado = mlticolastnd.eliminar(i);
                    PilaProductos pilaprodparavaciar = new PilaProductos();
                    while (!standsacado.getPp().esvacia()) {                    
                        Producto prodsacado = standsacado.getPp().eliminar();
                        if (prodsacado.getPrecio() > y) {
                            System.out.println("En la feria agropecuaria de fecha: " + x + "\nEl productor: " + standsacado.getProductor() + "\ndel Nro del stand: " + standsacado.getNroStand() + "\ntiene el producto mayor al precio " + y + "\n");
                        }
                        pilaprodparavaciar.adicionar(prodsacado);
                    }
                    mlticolastnd.adicionar(i, standsacado);
                }
            }
            colasimpagro.adicionar(feragrosacada);
        }
    }
    public static void cuantos (ColaSimpleComunidades colasimpcom, PilaMunicipìos pilamun, ColaSimpleAgropecuarias colasimpagro, MultiColaStands mlticolastand, String X) {
        int itr = mlticolastand.getN() + 1;
        for (int i = 1; i < itr; i++) {
            Stand standsacado = mlticolastand.eliminar(i);
            ColaSimpleComunidades colasimpcomparavaciar = new ColaSimpleComunidades();
            while (!colasimpcom.esvacia()) {                
                Comunidad comsacada = colasimpcom.eliminar();
                /*
                PilaMunicipios pilamunparavaciar = new PilaMunicipios();
                while(!pilamun.esvacia()) {
                    Municipio munsacado = pilamun.eliminar();
                    
                
                }
                */
                
                colasimpcomparavaciar.adicionar(comsacada);
            }
            colasimpcom.vaciar(colasimpcomparavaciar);
            mlticolastand.adicionar(i, standsacado);
        }
    }
}
