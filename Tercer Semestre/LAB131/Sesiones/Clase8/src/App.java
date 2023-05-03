
import java.util.*;
import java.util.ListIterator;

public class App {
    public static void main(String[] args) {
        LinkedList<Zona> lnkdlistZonas = new LinkedList<Zona>();
        //lista de zonas de la ciudad: nombre, microdistrito
        Zona zona1 = new Zona("Zona 1", "Macro 1", 15978);
        Zona zona2 = new Zona("Zona 2", "Macro 2", 194521);
        Zona zona3 = new Zona("Zona 3", "Macro 3", 489712);
        Zona zona4 = new Zona("Zona 4", "Macro 1", 1711);
        Zona zona5 = new Zona("Zona 5", "Macro 1", 19452);
        Zona zona6 = new Zona("Zona 6", "Macro 3", 461521);
        Zona zona7 = new Zona("Zona 7", "Macro 2", 48951);
        Zona zona8 = new Zona("Zona 8", "Macro 4", 19412);
        Zona zona9 = new Zona("Zona 9", "Macro 1", 89781);
        lnkdlistZonas.add(zona1);
        lnkdlistZonas.add(zona2);
        lnkdlistZonas.add(zona3);
        lnkdlistZonas.add(zona4);
        //Mostrar(lnkdlistZonas);
        Zona zona0 = new Zona("Zona 0", "Macro 0", 48915);
        lnkdlistZonas.add(2, zona0);
        Mostrar(lnkdlistZonas);
        //1. Mayor nro de habitantes
        Mayor(lnkdlistZonas);
        //2. Mostrar los nombres de las zonas que pertenecen al distrito x
        System.out.println("\nNombres de zonas que pertenecen al distrito Macro 2:");
        Mostrar(lnkdlistZonas, "Macro 2");
        //3. Crear un arraylist de zonas
        ArrayList<Zona> rrylistZona = new ArrayList<Zona>();  
        rrylistZona.add(zona5);
        rrylistZona.add(zona6);
        rrylistZona.add(zona7);
        rrylistZona.add(zona8);
        rrylistZona.add(zona9);
        System.out.println();
        Mostrar(rrylistZona);
        //4. Mayor numero de habitantes en el arraylist
        Mayor(rrylistZona);
        //5. Cuantas zonas tiene el macrodistrito x
        Cuantas(rrylistZona, "Macro 1");
        
        LDobleMacro listdoblemacro = new LDobleMacro();
        listdoblemacro.adifinal("Macro A", 1);
        listdoblemacro.adifinal("Macro B", 2);
        listdoblemacro.adifinal("Macro C", 3);
        listdoblemacro.adifinal("Macro D", 4);
        listdoblemacro.adifinal("Macro E", 5);
        listdoblemacro.adifinal("Macro F", 6);
        System.out.println();
        listdoblemacro.mostrar();
        //6. del nro x de macrodistrito, mostrar los nombres de las zonas
        //System.out.println("aaa");
        //Mostrar(listdoblemacro, lnkdlistZonas, 1);
        //7. mostrar el nro del macrodistrito y su cantidad de zonas
        
    }
    static public void Mostrar(LinkedList<Zona> lnkdlistZona){
        ListIterator<Zona> iterador = lnkdlistZona.listIterator();
        while (iterador.hasNext()) {            
            Zona zonasacada = iterador.next();
            zonasacada.mostrar();
        }
    }
    static public void Mayor(LinkedList<Zona> lnkdlistZona){
        int m = 0;
        ListIterator<Zona> iterador = lnkdlistZona.listIterator();
        while (iterador.hasNext()) {            
            Zona zonasacada = iterador.next();
            if (zonasacada.getNroHab() > m) {
                m = zonasacada.getNroHab();
            }
        }
        System.out.println("\nEl mayor nro de habitantes es:" + m);
    }
    static public void Mostrar(LinkedList<Zona> lnkdlistZona, String x){
        ListIterator<Zona> iterador = lnkdlistZona.listIterator();
        while (iterador.hasNext()) {            
            Zona zonasacada = iterador.next();
            if(zonasacada.getMacro().equals(x)) {
                System.out.println(zonasacada.getNombre());
            }
        }
    }
    static public void Mostrar(ArrayList<Zona> rrylistZona){
        for (int i = 0; i < rrylistZona.size(); i++) {
            Zona zonasacada = rrylistZona.get(i);
            zonasacada.mostrar();
        }
    }
    static public void Mayor(ArrayList<Zona> rrylistZona){
        int m = 0;
        for (int i = 0; i < rrylistZona.size(); i++) {
            Zona zonasacada = rrylistZona.get(i);
            if (zonasacada.getNroHab() > m) {
                m = zonasacada.getNroHab();
            }
        }
        System.out.println("\nEl mayor nro de habitantes es:" + m);
    }
    static public void Cuantas(ArrayList<Zona> rrylistZona, String x){
        int c = 0;
        for (int i = 0; i < rrylistZona.size(); i++) {
            Zona zonasacada = rrylistZona.get(i);
            if (zonasacada.getMacro().equals(x)) {
                c++;
            }
        }
        System.out.println("\nEl macrodistrito " + x + " tiene: " + c + " zonas");
    }
    static public void Mostrar(LDobleMacro listdoblemacro, LinkedList<Zona> lnkdlistZona, int x) {
        NodoMacro macroaux = listdoblemacro.getP();
        while (macroaux != null) {            
            if (macroaux.getNro() == x) {
                ListIterator<Zona> iterador = lnkdlistZona.listIterator();
                /*
                while (iterador.hasNext()) {            
                    Zona zonasacada = iterador.next();
                    if(zonasacada.getMacro().equals(x)) {
                        System.out.println(zonasacada.getNombre());
                    }
                }
                */
                System.out.println("123");
                while (iterador.hasNext()) {      
                    Zona zonasacada = iterador.next();
                    if (zonasacada.getMacro().equals(macroaux.getNombre())) {
                        System.out.println(zonasacada.getNombre());
                    }
                }
            }
            macroaux = macroaux.getSig();
        }
    }
}