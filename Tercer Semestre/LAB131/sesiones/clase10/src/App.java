public class App {
    public static void main(String[] args) {
        ListaSimpleEspecialidades listaSimpleEspecialidades1 = new ListaSimpleEspecialidades();
        ListaSimpleEspecialidades listaSimpleEspecialidades2 = new ListaSimpleEspecialidades();
        ListaSimpleEspecialidades listaSimpleEspecialidades3 = new ListaSimpleEspecialidades();
        ListaSimpleEspecialidades listaSimpleEspecialidades4 = new ListaSimpleEspecialidades();
        ListaSimpleCategorias listaSimpleCategorias = new ListaSimpleCategorias();
        ListaDobleInscritos listaDobleInscritos1 = new ListaDobleInscritos();
        ListaDobleInscritos listaDobleInscritos2 = new ListaDobleInscritos();
        ListaDobleInscritos listaDobleInscritos3 = new ListaDobleInscritos();
        ListaDobleInscritos listaDobleInscritos4 = new ListaDobleInscritos();
        ListaDobleInscritos listaDobleInscritos5 = new ListaDobleInscritos();
        ListaDobleInscritos listaDobleInscritos6 = new ListaDobleInscritos();
        ListaDobleInscritos listaDobleInscritos7 = new ListaDobleInscritos();
        ListaDobleMunicipios listaDobleMunicipios1 = new ListaDobleMunicipios();
        ListaDobleMunicipios listaDobleMunicipios2 = new ListaDobleMunicipios();
        ListaDobleMunicipios listaDobleMunicipios3 = new ListaDobleMunicipios();
        ListaDobleDepartamentos listaDobleDepartamentos = new ListaDobleDepartamentos();
        
        //int idEsp, int nroPremios, int montoPremio, String nomEsp)
        listaSimpleEspecialidades1.adifinal(1, 1, 500, "Microcuento");
        listaSimpleEspecialidades1.adifinal(2, 1, 800, "Cuento");
        listaSimpleEspecialidades1.adifinal(3, 2, 400, "Poesia");
        listaSimpleEspecialidades1.adifinal(4, 1, 1000, "Novela");
        
        listaSimpleEspecialidades2.adifinal(5, 2, 200, "Musica Altiplano");
        listaSimpleEspecialidades2.adifinal(6, 2, 200, "Danza Altiplano");
        listaSimpleEspecialidades2.adifinal(7, 1, 700, "Artesania Altiplano");
        listaSimpleEspecialidades2.adifinal(8, 1, 650, "Artesania Altiplano");
        
        listaSimpleEspecialidades3.adifinal(9, 1, 300, "Musica Valles");
        listaSimpleEspecialidades3.adifinal(10, 2, 200, "Danza Valles");
        listaSimpleEspecialidades3.adifinal(11, 1, 600, "Artesania Valles");
        listaSimpleEspecialidades3.adifinal(12, 2, 550, "Artesania Valles");
        
        listaSimpleEspecialidades4.adifinal(13, 1, 180, "Musica Oriente");
        listaSimpleEspecialidades4.adifinal(14, 2, 450, "Danza Oriente");
        listaSimpleEspecialidades4.adifinal(15, 2, 310, "Artesania Oriente");
        listaSimpleEspecialidades4.adifinal(16, 2, 375, "Artesania Oriente");
        
        //int idCat, String nomCat, ListaSimpleEspecialidades listaSimpleEspecialidades)
        listaSimpleCategorias.adifinal(1, "Letras y Tradicion Oral", listaSimpleEspecialidades1);
        listaSimpleCategorias.adifinal(2, "Cultura Altiplano", listaSimpleEspecialidades2);
        listaSimpleCategorias.adifinal(3, "Cultura Valles", listaSimpleEspecialidades3);
        listaSimpleCategorias.adifinal(4, "Cultura Oriente", listaSimpleEspecialidades4);
        
        //int idIns, String nomIns, int idCat, int idEsp, int puntaje){
        listaDobleInscritos1.adiFinal(1, "Pedro", 1, 2, 61);
        listaDobleInscritos1.adiFinal(2, "Juan", 2, 8, 75);
        listaDobleInscritos1.adiFinal(3, "Jose", 3, 10, 30);
        listaDobleInscritos1.adiFinal(4, "Fernando", 3, 11, 15);
        listaDobleInscritos1.adiFinal(5, "Francisco", 4, 15, 79);
        
        listaDobleInscritos2.adiFinal(6, "Maria", 1, 2, 84);
        listaDobleInscritos2.adiFinal(7, "Jorge", 1, 4, 55);
        listaDobleInscritos2.adiFinal(8, "Isac", 2, 5, 68);
        listaDobleInscritos2.adiFinal(9, "Lucas", 4, 16, 91);
        
        listaDobleInscritos3.adiFinal(10, "Sancho", 1, 1, 45);
        listaDobleInscritos3.adiFinal(11, "Julio", 2, 7, 98);
        listaDobleInscritos3.adiFinal(12, "Pepe", 3, 9, 45);
        listaDobleInscritos3.adiFinal(13, "Amelio", 4, 13, 47);
        listaDobleInscritos3.adiFinal(14, "Frank", 4, 15, 65);
        
        listaDobleInscritos4.adiFinal(15, "Tete", 1, 16, 75);
        listaDobleInscritos4.adiFinal(16, "Miguel", 1, 3, 18);
        listaDobleInscritos4.adiFinal(17, "Rafael", 2, 5, 48);
        listaDobleInscritos4.adiFinal(18, "Simon", 2, 6, 28);
        
        listaDobleInscritos5.adiFinal(19, "Ortega", 1, 1, 85);
        listaDobleInscritos5.adiFinal(20, "Kevin", 2, 6, 64);
        listaDobleInscritos5.adiFinal(21, "Ben", 2, 6, 76);
        listaDobleInscritos5.adiFinal(22, "Wen", 2, 8, 28);
        listaDobleInscritos5.adiFinal(23, "Luck", 3, 10, 45);
        
        listaDobleInscritos6.adiFinal(24, "Jhon", 1, 4, 70);
        listaDobleInscritos6.adiFinal(25, "Jeremias", 2, 7, 68);
        listaDobleInscritos6.adiFinal(26, "Hector", 3, 12, 47);
        listaDobleInscritos6.adiFinal(27, "Torreria", 4, 12, 64);
        
        listaDobleInscritos7.adiFinal(28, "Jan", 1, 2, 88);
        listaDobleInscritos7.adiFinal(29, "Aragones", 1, 3, 74);
        listaDobleInscritos7.adiFinal(30, "Udfarte", 3, 11, 38);
        listaDobleInscritos7.adiFinal(31, "Kiko", 4, 12, 41);
        
        //int idMun, String nomMun, ListaDobleInscritos listaDobleInscritos){
        listaDobleMunicipios1.adiFinal(1, "municipio primero", listaDobleInscritos1);
        listaDobleMunicipios1.adiFinal(2, "municipio segundo", listaDobleInscritos2);
        
        listaDobleMunicipios2.adiFinal(3, "municipio tercero", listaDobleInscritos3);
        listaDobleMunicipios2.adiFinal(4, "municipio cuarto", listaDobleInscritos4);
        
        listaDobleMunicipios3.adiFinal(5, "municipio quinto", listaDobleInscritos5);
        listaDobleMunicipios3.adiFinal(6, "municipio sexto", listaDobleInscritos6);
        listaDobleMunicipios3.adiFinal(7, "municipio septimo", listaDobleInscritos7);
        
        //int idDpto, String nomDpto, ListaDobleMunicipios listaDobleMunicipios){
        listaDobleDepartamentos.adiFinal(1, "Oruro", listaDobleMunicipios1);
        listaDobleDepartamentos.adiFinal(2, "La Paz", listaDobleMunicipios2);
        listaDobleDepartamentos.adiFinal(3, "Santa Cruz", listaDobleMunicipios3);
        
        //mostrar nodo de especialidades 
        System.out.println();
        listaSimpleEspecialidades1.mostrar(listaSimpleEspecialidades1.getNodo());
        //mostrar(listaSimpleEspecialidades1.getNodo());
        
        //verificar si existe la categoria X
        System.out.println("\nCategoria Poesia: " + verifica(listaSimpleEspecialidades1.getNodo(), "Poesia"));
        
        //mostrar la lista de categorias
        System.out.println();
        mostrar(listaSimpleCategorias.getNodo());
        
        // 3. mostrar inscritos de forma recursiva
        System.out.println();
        mostrar(listaDobleInscritos1.getNodo());
        
        // 4. mostrar los municipios
        System.out.println();
        mostrar(listaDobleMunicipios1.getNodo());
        
        // 5. mostrar los departamentos
        System.out.println();
        mostrar(listaDobleDepartamentos.getNodo());
        
        //6. mostrar los inscritos con Categoria y especialidad
        System.out.println();
        mostrarInscritos(listaDobleInscritos1.getNodo(), listaSimpleCategorias);
    }
    
    public static void mostrar(NodoSimpleEspecialidades nodo) {
        if (nodo != null) {
            System.out.println(nodo.getNomEsp() + " " + nodo.getIdEsp() + " " + nodo.getNroPremios() + " " + nodo.getMontoPremio());
            mostrar(nodo.getSig());
        }
    }
    
    public static boolean verifica (NodoSimpleEspecialidades nodo, String x) {
        if (nodo != null) {
            if (nodo.getNomEsp().equals(x)) {
                return true;
            }
            return verifica(nodo.getSig(), x);
        }
        else {
            return false;
        }
    }
    
    public static void mostrar(NodoSimpleCategorias nodo) {
        if (nodo != null) {
            System.out.println("[" + nodo.getNomCat() + " " + nodo.getIdCat() + "]");
            mostrar(nodo.getListaSimpleEspecialidades().getNodo());
            mostrar(nodo.getSig());
        }
    }
    
    public static void mostrar(NodoDobleInscritos o) {
        if (o != null) {
            System.out.println(o.getIdIns() + " " + o.getNomIns() + " " + o.getIdCat() + " " + o.getIdEsp() + " " + o.getPuntaje());
            mostrar(o.getSig());
        }
    }
    
    public static void mostrar(NodoDobleMunicipios o) {
        if (o != null) {
            System.out.println("<" + o.getIdMun() + " " + o.getNomMun() + ">");
            mostrar(o.getListaDobleInscritos().getNodo());
            mostrar(o.getSig());
        }
    }
    
    public static void mostrar(NodoDobleDepartamentos o) {
        if (o != null) {
            System.out.println("[" + o.getIdDpto() + " " + o.getNomDpto() + "]");
            mostrar(o.getListaDobleMunicipios().getNodo());
            mostrar(o.getSig());
        }
    }
    
    public static void mostrarInscritos(NodoDobleInscritos nodo, ListaSimpleCategorias nodoa) {
        if (nodo != null) {
            System.out.println(nodo.getNomIns() + " " + nombreCat(nodoa.getNodo(), nodo.getIdCat()) + " " + nombreEsp(nodoa.getNodo(), nodo.getIdEsp()) + " " + nodo.getIdCat() + " " + nodo.getIdEsp() + " " + nodo.getPuntaje());
        }
    }
    
    public static String nombreCat(NodoSimpleCategorias nodo, int id) {
        if (nodo != null) {
            if (nodo.getIdCat() == id) {
                return nodo.getNomCat();
            }
            return nombreCat(nodo.getSig(), id);
        }
        else
            return "";
    }
    
     public static String nombreEsp (NodoSimpleCategorias nodo, int id) {
         if (nodo != null) {
             String e = busca(nodo.getListaSimpleEspecialidades().getNodo() ,id);
             if (!e.equals("")) {
                 return e;
             }
             return nombreEsp(nodo.getSig(), id);
         }
         else
             return "";
     }
     
     public static String busca (NodoSimpleEspecialidades nodo, int id) {
         if (nodo != null) {
             if (nodo.getIdEsp() == id) {
                 return nodo.getNomEsp();
             }
             return busca(nodo.getSig(), id);
         }
         else 
             return "";
     }
}