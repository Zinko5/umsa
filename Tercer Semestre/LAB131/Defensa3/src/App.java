import java.util.*;
public class App {
   public static void main(String[] args) {
       ListaDobleCategorias listaDobleCategorias = new ListaDobleCategorias();
       listaDobleCategorias.adiFinal("1", "Expresiones Culturales Altiplano");
       listaDobleCategorias.adiFinal("2", "Expresiones Culturales Valles");
       listaDobleCategorias.adiFinal("3", "Expresiones Culturales Oriente");
       
       ArrayList<Especialidades> arrayListEspecialidades = new ArrayList<Especialidades>();
       Especialidades especialidades1 = new Especialidades("1", "1", "Musica y Danza Altiplano");
       Especialidades especialidades2 = new Especialidades("2", "1", "Tejido Altiplano");
       Especialidades especialidades3 = new Especialidades("4", "1", "Memoria y Tradicion Oral Altiplano");
       Especialidades especialidades4 = new Especialidades("5", "2", "Musica y Danza Valles");
       Especialidades especialidades5 = new Especialidades("7", "2", "Artes Originarias Valles");
       Especialidades especialidades6 = new Especialidades("10", "3", "Tejido Oriente");
       Especialidades especialidades7 = new Especialidades("12", "3", "Memoria y Tradicion Oral Oriente");
       arrayListEspecialidades.add(especialidades1);
       arrayListEspecialidades.add(especialidades2);
       arrayListEspecialidades.add(especialidades3);
       arrayListEspecialidades.add(especialidades4);
       arrayListEspecialidades.add(especialidades5);
       arrayListEspecialidades.add(especialidades6);
       arrayListEspecialidades.add(especialidades7);
       
       ListaSimpleGanadores listaSimpleGanadores = new ListaSimpleGanadores();
       listaSimpleGanadores.adifinal(4578945, "Jorge", "Resureccion", "Aldo", "Koke", "5", "La Paz");
       listaSimpleGanadores.adifinal(15411, "Saul", "Ñiguez", "Perez", "Ocho", "7", "Beni");
       listaSimpleGanadores.adifinal(9875412, "Angel", "Correa", "Milagro", "Angelito", "1", "Cochabamba");
       listaSimpleGanadores.adifinal(7481152, "Luis", "Diaz", "Suarez", "Lucho", "10", "Pando");
       listaSimpleGanadores.adifinal(89878564, "Juan", "Feliz", "Filix", "120Millones", "4", "Oruro");
       
       //a) mostrar
       listaDobleCategorias.mostrar();
       System.out.println();
       mostrar(arrayListEspecialidades);
       System.out.println();
       listaSimpleGanadores.mostrar();
       
       //b)
       System.out.println();
       Cuantos("La Paz", "Musica y Danza Valles", listaSimpleGanadores, arrayListEspecialidades, listaDobleCategorias);
       
       //c)
       System.out.println();
       verifica("Pando", "Expresiones Culturales Oriente", listaSimpleGanadores, arrayListEspecialidades, listaDobleCategorias);
       System.out.println();
       verifica("Oruro", "Expresiones Culturales Oriente", listaSimpleGanadores, arrayListEspecialidades, listaDobleCategorias);
   } 
    static public void mostrar(ArrayList<Especialidades> rrylist){
        for (int i = 0; i < rrylist.size(); i++) {
            Especialidades objetosacado = rrylist.get(i);
            objetosacado.mostrar();
        }
    }
    static public void Cuantos(String x, String y, ListaSimpleGanadores listaSimpleGanadores, ArrayList<Especialidades> arrayList, ListaDobleCategorias listaDobleCategorias)
    {
        NodoSimpleGanadores d = listaSimpleGanadores.getNodo();
        System.out.println("La cantidad de ganadores del departamento " + x + " en la categoria " + y + " es: ");
        int con = 0;
        while(d != null)//recorre hasta el final
        {
            if (d.getLugar().equals(x)) {
                for (int i = 0; i < arrayList.size(); i++) {
                    Especialidades objetosacado = arrayList.get(i);
                    if (objetosacado.getIdEsp().equals(d.getIdEsp())) {
                        NodoDobleCategorias o = listaDobleCategorias.getNodo();
                        while(o != null)
                        {
                            if (o.getIdCat().equals(objetosacado.getIdCat())) {
                                con++;
                            }
                            
                        /*cosas del problema */
                        o=o.getSig();
                        }
                        
                    }
                }
            }
            
            /*cosas del problema */
            d = d.getSig();
        }
        System.out.println(con);
    }
    static public void verifica(String y, String x, ListaSimpleGanadores listaSimpleGanadores, ArrayList<Especialidades> arrayList, ListaDobleCategorias listaDobleCategorias)
    {
        NodoSimpleGanadores d = listaSimpleGanadores.getNodo();
        boolean ver = false;
        while(d != null)//recorre hasta el final
        {
            if (d.getLugar().equals(y)) {
                for (int i = 0; i < arrayList.size(); i++) {
                    Especialidades objetosacado = arrayList.get(i);
                    if (objetosacado.getIdEsp().equals(d.getIdEsp())) {
                        NodoDobleCategorias o = listaDobleCategorias.getNodo();
                        while(o != null)
                        {
                            if (o.getIdCat().equals(objetosacado.getIdCat()) && o.getNomCat().equals(x)) {
                                ver = true;
                            }
                            
                        /*cosas del problema */
                        o=o.getSig();
                        }
                        
                    }
                }
            }
            
            /*cosas del problema */
            d = d.getSig();
        }
        if (ver) {
            System.out.println("Si existe un ganador en la categoria " + x + " del departamento " + y);
        }
        else {
            System.out.println("no existe un ganador en la categoria " + x + " del departamento " + y);
        }
    }
}
