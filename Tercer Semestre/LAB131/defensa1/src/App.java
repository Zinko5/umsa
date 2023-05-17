import java.util.Stack;
public class App {
    public static void main(String[] args) {
        ColaSimpleCategorias CoSimCat = new ColaSimpleCategorias();
        Stack<Especialidades> StEsp = new Stack<Especialidades>();
        ColaCircularParticipantes CoCirPar = new ColaCircularParticipantes();
        Categoria cat1 = new Categoria(6, "Artes Graficas");
        Categoria cat2 = new Categoria(2, "Expresiones Culturales Valles");
        Categoria cat3 = new Categoria(3, "Expresiones Culturales Oriente");
        Especialidades esp1 = new Especialidades(37, 6, "VideoJuego");
        Especialidades esp2 = new Especialidades(9, 3, "Musica y Danza Oriente");
        Especialidades esp3 = new Especialidades(7, 2, "Artes Originarias Valles");
        Participantes par1 = new Participantes(15578, "Juan", "Calle", "Salas", "Salado", 7, "La Paz");
        Participantes par2 = new Participantes(15578, "Saul", "Pozo", "Ñiguez", "Ocho", 9, "Tarija");
        Participantes par3 = new Participantes(15578, "Jorge", "Carrasco", "Resureccion", "Koke", 37, "Pando");
        CoSimCat.adicionar(cat1);
        CoSimCat.adicionar(cat2);
        CoSimCat.adicionar(cat3);
        StEsp.push(esp1);
        StEsp.push(esp2);
        StEsp.push(esp3);
        CoCirPar.adicionar(par1);
        CoCirPar.adicionar(par2);
        CoCirPar.adicionar(par3);
        //a) crear estructuras y mostrar
        CoSimCat.mostrar();
        mostrarStack(StEsp);
        CoCirPar.mostrar();
        //b) del participante con nombre x, paterno y, materno z, determinar la nomCat y nomEsp
        determinar(StEsp, CoSimCat, CoCirPar, "Jorge", "Carrasco", "Resureccion");
        //c) verificar si existe un ganador en la categoria X del lugar Y
        System.out.println();
        verificar(StEsp, CoSimCat, CoCirPar, "Expresiones Culturales Valles", "La Paz");
        verificar(StEsp, CoSimCat, CoCirPar, "Expresiones Culturales Altiplano", "La Paz");
        verificar(StEsp, CoSimCat, CoCirPar, "Expresiones Culturales Valles", "Beni");
    }
    static public void determinar(Stack<Especialidades> SE, ColaSimpleCategorias CSC, ColaCircularParticipantes CCP, String x, String y, String z) {
        ColaCircularParticipantes auxccp = new ColaCircularParticipantes();
        while (!CCP.esvacia()) {            
            Participantes aux = CCP.eliminar();
            if (aux.getNom().equals(x) && aux.getPat().equals(y) && aux.getMat().equals(z)) {
                System.out.println("Participante de nombre " + x + ", paterno " + y + " y materno " + z + ":\nCategoria y especialidad:");
                Stack<Especialidades> auxse = new Stack<Especialidades>();
                while (!SE.empty()) {                    
                    Especialidades auxe = SE.pop();
                    ColaSimpleCategorias auxcsc = new ColaSimpleCategorias();
                    while (!CSC.esvacia()) {                        
                        Categoria auxc = CSC.eliminar();
                        if (aux.getIdEsp() == auxe.getIdEsp() && auxe.getIdCat() == auxc.getIdCat()) {
                            System.out.println(auxc.getNomCat());
                        }
                        auxcsc.adicionar(auxc);
                    }
                    if (aux.getIdEsp() == auxe.getIdEsp()) {
                        System.out.println(auxe.getNomEsp());
                    }
                    CSC.vaciar(auxcsc);
                    auxse.push(auxe);
                    //ColaSimpleCategoriaspush pop empty stick
                }
                while(!auxse.empty()) {
                    Especialidades espaux = auxse.pop();
                    SE.add(espaux);
                }
                
            }
            auxccp.adicionar(aux);
        }
        CCP.vaciar(auxccp);
    }
    static public void verificar(Stack<Especialidades> SE, ColaSimpleCategorias CSC, ColaCircularParticipantes CCP, String x, String y) {
        ColaCircularParticipantes auxccp = new ColaCircularParticipantes();
        boolean c = false;
        while (!CCP.esvacia()) {            
            Participantes aux = CCP.eliminar();
            if (aux.getLugar().equals(y)) {
                Stack<Especialidades> auxse = new Stack<Especialidades>();
                while (!SE.empty()) {                    
                    Especialidades auxe = SE.pop();
                    ColaSimpleCategorias auxcsc = new ColaSimpleCategorias();
                    while (!CSC.esvacia()) {                        
                        Categoria auxc = CSC.eliminar();
                        if (aux.getIdEsp() == auxe.getIdEsp() && auxe.getIdCat() == auxc.getIdCat() && auxc.getNomCat().equals(x)) {
                            c = true;
                        }
                        auxcsc.adicionar(auxc);
                    }
                    CSC.vaciar(auxcsc);
                    auxse.push(auxe);
                    //ColaSimpleCategoriaspush pop empty stick
                }
                while(!auxse.empty()) {
                    Especialidades espaux = auxse.pop();
                    SE.add(espaux);
                }
                
            }
            auxccp.adicionar(aux);
        }
        CCP.vaciar(auxccp);
        if (c) {
            System.out.println("Si existe un ganador de " + y + " en categoria " + x);
        }
        else {
            System.out.println("No existe un ganador de " + y + " en categoria " + x);
        }
    }
    static public void mostrarStack(Stack<Especialidades> S) {
        Stack<Especialidades> aux = new Stack<Especialidades>();
        System.out.println("Elemtentos del Stack: ");
        while(!S.empty()) {
            Especialidades espaux = S.pop();
            System.out.print("<");
            espaux.mostrar();
            System.out.println("> ");
            aux.add(espaux);
        }
        System.out.println();
        while(!aux.empty()) {
            Especialidades espaux = aux.pop();
            S.add(espaux);
        }
    }
}
