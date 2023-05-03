public class App {
    public static void main(String[] args) {
        //1
        PilaDI pdi1 = new PilaDI();
        Def_Inf di1 = new Def_Inf(1, 1, "Colas", "Jose");
        Def_Inf di2 = new Def_Inf(4, 2, "Pilas", "Juan");
        Def_Inf di3 = new Def_Inf(3, 2, "Pilas y Colas", "Lucas");
        Def_Inf di4 = new Def_Inf(3, 1, "Pilas y Colas", "Pedro");
        Def_Inf di5 = new Def_Inf(4, 3, "Pilas", "Diego");
        Def_Inf di6 = new Def_Inf(2, 2, "Stacks", "Luis");
        pdi1.adicionar(di1);
        pdi1.adicionar(di2);
        pdi1.adicionar(di3);
        pdi1.adicionar(di4);
        pdi1.adicionar(di5);
        pdi1.adicionar(di6);
        //2
        PilaDI pdi2 = new PilaDI();
        Def_Inf di7 = new Def_Inf(2, 1, "Stacks", "Kiko");
        Def_Inf di8 = new Def_Inf(3, 2, "Pilas y Colas", "Fernando");
        Def_Inf di9 = new Def_Inf(2, 2, "Stacks", "Radamel");
        Def_Inf di10 = new Def_Inf(5, 1, "Queues", "Luis");
        Def_Inf di11 = new Def_Inf(4, 3, "Pilas", "Ruben");
        Def_Inf di12 = new Def_Inf(1, 2, "Colas", "Martin");
        pdi2.adicionar(di7);
        pdi2.adicionar(di8);
        pdi2.adicionar(di9);
        pdi2.adicionar(di10);
        pdi2.adicionar(di11);
        pdi2.adicionar(di12);
        //3
        PilaDI pdi3 = new PilaDI();
        Def_Inf di13 = new Def_Inf(5, 1, "Queues", "Ben");
        Def_Inf di14 = new Def_Inf(1, 2, "Colas", "Toni");
        Def_Inf di15 = new Def_Inf(3, 2, "Pilas y Colas", "Walter");
        Def_Inf di16 = new Def_Inf(1, 1, "Colas", "Diego");
        Def_Inf di17 = new Def_Inf(4, 3, "Pilas", "Santiago");
        Def_Inf di18 = new Def_Inf(2, 2, "Stacks", "Rodrigo");
        pdi3.adicionar(di3);
        pdi3.adicionar(di14);
        pdi3.adicionar(di15);
        pdi3.adicionar(di16);
        pdi3.adicionar(di17);
        pdi3.adicionar(di18);
        //pila de pilas
        PilaPilaDI ppdi1 = new PilaPilaDI();
        ppdi1.adicionar(pdi1);
        ppdi1.adicionar(pdi2);
        ppdi1.adicionar(pdi3);
        //1.mostrar
        ppdi1.mostrar();
        //2.mostrar con nombre
        System.out.println();
        buscar(ppdi1, "Luis");
        //3.cuantas defensas e infromes se presento del tema x
        System.out.println();
        cuantas(ppdi1, "Stacks");
        MultiPilaDI mpdi = new MultiPilaDI();
        mpdi.adicionar(1, di11);
        mpdi.adicionar(1, di17);
        mpdi.adicionar(1, di15);
        mpdi.adicionar(1, di3);
        mpdi.adicionar(2, di14);
        mpdi.adicionar(2, di4);
        mpdi.adicionar(2, di5);
        mpdi.adicionar(2, di6);
        mpdi.adicionar(2, di7);
        mpdi.adicionar(3, di8);
        mpdi.adicionar(3, di9);
        mpdi.adicionar(3, di13);
        mpdi.adicionar(3, di12);
        mpdi.adicionar(4, di18);
        mpdi.adicionar(4, di16);
        mpdi.adicionar(4, di10);
        mpdi.adicionar(4, di2);
        mpdi.adicionar(4, di1);
        mpdi.setNp(4);
        //4. mostrar
        mpdi.mostrar();
        //5. mostrar con nombre
        System.out.println();
        buscar(mpdi, "Diego");
        //6. cuantas defensas e infromes se presento del tema x
        System.out.println();
        cuantas(mpdi, "Pilas y Colas");
    }
    public static void buscar(PilaPilaDI PilaDePilas, String x) {
        System.out.println("Presentadas por " + x + ":");
        PilaPilaDI PilaDePilasAux = new PilaPilaDI();
        PilaDI PilaDefensasInformesAux = new PilaDI();
        while (!PilaDePilas.esvacia()) {            
            PilaDI PilaDefensasInformesAux2 = PilaDePilas.eliminar();
            while (!PilaDefensasInformesAux2.esvacia()) {                
                Def_Inf DefensasInformesAux = PilaDefensasInformesAux2.eliminar();
                if (DefensasInformesAux.getNombre().equals(x)) {
                    DefensasInformesAux.mostrar();
                    System.out.println();
                }
                PilaDefensasInformesAux.adicionar(DefensasInformesAux);
            }
            PilaDefensasInformesAux2.vaciar(PilaDefensasInformesAux);
            PilaDePilasAux.adicionar(PilaDefensasInformesAux2);
        }
        PilaDePilas.vaciar(PilaDePilasAux);
    }
    public static void cuantas (PilaPilaDI PilaDePilas, String x) {
        int c = 0;
        System.out.println("Defensas e Informes pesentados del tema " + x + ":");
        PilaPilaDI PilaDePilasAux = new PilaPilaDI();
        PilaDI PilaDefensasInformesAux = new PilaDI();
        while (!PilaDePilas.esvacia()) {            
            PilaDI PilaDefensasInformesAux2 = PilaDePilas.eliminar();
            while (!PilaDefensasInformesAux2.esvacia()) {                
                Def_Inf DefensasInformesAux = PilaDefensasInformesAux2.eliminar();
                if (DefensasInformesAux.getTema().equals(x)) {
                    c++;
                }
                PilaDefensasInformesAux.adicionar(DefensasInformesAux);
            }
            PilaDefensasInformesAux2.vaciar(PilaDefensasInformesAux);
            PilaDePilasAux.adicionar(PilaDefensasInformesAux2);
        }
        PilaDePilas.vaciar(PilaDePilasAux);
        System.out.println(c);
    }
    public static void buscar(MultiPilaDI MultiPilaDefensasInformes, String x) {
        System.out.println("Presentadas por " + x + ":");
        PilaDI PilaDefensaSInformesAux = new PilaDI();
        for (int i = 1; i <= MultiPilaDefensasInformes.getNp(); i++) {
            while (!MultiPilaDefensasInformes.esvacia(i)) {                
                Def_Inf DefensasInformesAux = MultiPilaDefensasInformes.eliminar(i);
                if (DefensasInformesAux.getNombre().equals(x)) {
                    DefensasInformesAux.mostrar();
                    System.out.println();
                }
                PilaDefensaSInformesAux.adicionar(DefensasInformesAux);
            }
            MultiPilaDefensasInformes.vaciar(i, PilaDefensaSInformesAux);
        }
    }
    public static void cuantas(MultiPilaDI MultiPilaDefensasInformes, String x) {
        int c = 0;
        System.out.println("Defensas e Informes pesentados del tema " + x + ":");
        PilaDI PilaDefensaSInformesAux = new PilaDI();
        for (int i = 1; i <= MultiPilaDefensasInformes.getNp(); i++) {
            while (!MultiPilaDefensasInformes.esvacia(i)) {                
                Def_Inf DefensasInformesAux = MultiPilaDefensasInformes.eliminar(i);
                if (DefensasInformesAux.getTema().equals(x)) {
                    c++;
                }
                PilaDefensaSInformesAux.adicionar(DefensasInformesAux);
            }
            MultiPilaDefensasInformes.vaciar(i, PilaDefensaSInformesAux);
        }
        System.out.println(c);
    }
}