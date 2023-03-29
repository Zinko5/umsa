public class App {
    public static void main(String[] args) {
        PilaM pm = new PilaM();
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
        ColaC cc = new ColaC();
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
        ColaA ca = new ColaA();
        FeriaAgro fa = new FeriaAgro("15/02/21", "Calle 12", "Segunda version");
        FeriaAgro fa1 = new FeriaAgro("19/12/23", "Calle 10", "Primera version");
        FeriaAgro fa2 = new FeriaAgro("25/10/19", "Calle 2", "Segunda version");
        FeriaAgro fa3 = new FeriaAgro("10/09/22", "Calle 15", "Cuarta version");
        FeriaAgro fa4 = new FeriaAgro("05/02/20", "Calle 9", "Tercera version");
        ca.adicionar(fa);
        ca.adicionar(fa1);
        ca.adicionar(fa2);
        ca.adicionar(fa3);
        ca.adicionar(fa4);
        //1
        pm.mostrar();
        //2
        cc.mostrar();
        //3
        ca.mostrar();
        //stand 1
        Producto p = new Producto("Manzana", "Fruta", 6, 30);
        Producto p1 = new Producto("Lechuga", "Verdura", 2, 16);
        Producto p2 = new Producto("Zapatos", "Ropa", 12, 8);
        PilaP pp = new PilaP();
        pp.adicionar(p);
        pp.adicionar(p1);
        pp.adicionar(p2);
        Stand s = new Stand(1, 51, "Pepe", pp);
        //stand 2
        Producto p4 = new Producto("Banana", "Fruta", 5, 20);
        Producto p5 = new Producto("Tomate", "Verdura", 10, 14);
        Producto p6 = new Producto("Gorra", "Ropa", 11, 18);
        PilaP pp1 = new PilaP();
        pp1.adicionar(p4);
        pp1.adicionar(p5);
        pp1.adicionar(p6);
        Stand s1 = new Stand(2, 20, "Jorge", pp1);
        //stand 3
        Producto p7 = new Producto("Sandia", "Fruta", 11, 10);
        Producto p8 = new Producto("Pepino", "Verdura", 5, 21);
        Producto p9 = new Producto("Chompa", "Ropa", 12, 20);
        PilaP pp2 = new PilaP();
        pp2.adicionar(p7);
        pp2.adicionar(p8);
        pp2.adicionar(p9);
        Stand s2 = new Stand(3, 10, "Trump", pp2);
        //stand 4
        Producto p10 = new Producto("Banana", "Fruta", 2, 12);
        Producto p11 = new Producto("Tomate", "Verdura", 6, 15);
        Producto p12 = new Producto("Gorra", "Ropa", 5, 5);
        PilaP pp3 = new PilaP();
        pp3.adicionar(p10);
        pp3.adicionar(p11);
        pp3.adicionar(p12);
        Stand s3 = new Stand(4, 15, "Saul", pp3);
        //Multicola de stands
        MultiColaS mcs = new MultiColaS();
        mcs.setN(2);
        mcs.adicionar(1, s);
        mcs.adicionar(1, s1);
        mcs.adicionar(2, s2);
        mcs.adicionar(2, s3);
        mcs.mostrar();
    }
}
