public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");
    }
    /*Lista simple */
    public void ejercicios(ListaSimple lstasmple)
    {
        NodoSimple o = lstasmple.getNodo();
        while(o != null)//recorre hasta el final
        {
            /*cosas del problema */
            o = o.getSig();
        }
    }
    
    /*Lista doble */
    public void ejerciciod(ListaDoble lstadble)
    {
        NodoDoble o = lstadble.getNodo();
        while(o != null)
        {
            /*cosas del problema */
            o=o.getSig();
        }
    }

    /*Lista circular simple*/
    public void ejerciciocs(ListaCircularSimple lstacirsmple)
    {
        NodoCircularSimple r = lstacirsmple.getNodo();
	    while (r.getSig() != lstacirsmple.getNodo()){
            /*cosas del problema */
            r = r.getSig();
        }
        /*mismas cosas del problema de arriba */
    }

    /*Lista circular doble */
    public void ejerciciocd(ListaCircularDoble lstacirdble)
    {
        NodoCircularDoble r = lstacirdble.getNodo();
	    while (r.getSig() != lstacirdble.getNodo()){
            /*cosas del problema */
            r = r.getSig();
        }
        /*mismas cosas del problema de arriba */
    }
}
