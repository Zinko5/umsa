public class App {
    public static void main(String[] args) throws Exception {
        ListaSimpleOraciones listaOraciones = new ListaSimpleOraciones();
        listaOraciones.adifinal("esta es una oracion");
        listaOraciones.adifinal("listas simples, dobles y circulares");
        listaOraciones.adifinal("oracion del final");
        ListaSimpleOraciones listaOraciones2 = new ListaSimpleOraciones();
        listaOraciones2.adifinal("oracion de segunda lista");
        listaOraciones2.adifinal("otra de segunda lista");
        listaOraciones2.adifinal("final de la segunda lista");
        listaOraciones.mostrar();
        System.out.println();
        listaOraciones2.mostrar();
        mostrar(listaOraciones, listaOraciones2, 3);
    }
    static public void mostrar(ListaSimpleOraciones listaOraciones, ListaSimpleOraciones listaOraciones2, int x)
    {
        NodoSimpleOraciones o = listaOraciones.getNodo();
        int i = 1, it = 0;
        while(o != null)//recorre hasta el final
        {
            if (i == x) {
                NodoSimpleOraciones a = listaOraciones2.getNodo();
                System.out.println("\ncoincidencias con <" + o.getOracion() + ">:");
                while(a != null)//recorre hasta el final
                {
                    it ++;
                    mostrarPalabras(o, a, it);
                    /*cosas del problema */
                    a = a.getSig();
                }
            }
            /*cosas del problema */
            i++;
            o = o.getSig();
        }
    }
    static public void mostrarPalabras(NodoSimpleOraciones nodoOraciones, NodoSimpleOraciones nodoOraciones2, int it) {
        for (int i = 0; i < getPalabras(nodoOraciones.getOracion()); i++) {
            for (int j = 0; j < getPalabras(nodoOraciones2.getOracion()); j++) {
                String ora1 = sacarPalabra(nodoOraciones.getOracion(), i);
                String ora2 = sacarPalabra(nodoOraciones2.getOracion(), j);
                if (ora1.equals(ora2)) {
                    System.out.print(nodoOraciones2.getOracion());
                    System.out.println(" - " + it + "º nodo");
                }
            }
        }
    }
    static public int getPalabras(String x) {
        int c = 1;
        for (int i = 0; i < x.length(); i++) {
            if (x.substring(i, i + 1).equals(" ")) {
                c++;
            }
        }
        return c;
    }
    static public String sacarPalabra(String palabra, int indice) {
        int p = 0;//p es el indice de la palabra
		indice = indice + 1;
		String m = "", z = "";
		palabra = palabra + " ";
		for(int i = 0; i < palabra.length(); i++) {
            //se repasa letra por letra
			if(palabra.substring(i, i + 1).equals(" ")) {
				p = p + 1; //si la letra es un espacio, en p se sumara un indice de palabra
				if(p == indice) {
					z = m;
				}
				m = "";//se reinicia m
			}
			else {//si la letra no es un espacio, en m se ira formando la palabra letra por letra
				m = m + palabra.substring(i, i + 1);
			}
		}
		return z;
    }
}
