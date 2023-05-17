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
        
        listaSimpleCategorias.mostrar();
        System.out.println();
        listaDobleDepartamentos.mostrar();
        
        //a) cuantas especialidades no tienen participantes inscritos del departamento x
        System.out.println();
        sinInscritos(listaSimpleCategorias, listaDobleDepartamentos, "Oruro");
        //b) Mostrar el nombre de los inscritos con el menor puntaje en la categoria con nomCat X
        System.out.println();
        menorPuntaje(listaSimpleCategorias, listaDobleDepartamentos, "Cultura Altiplano");
        //c) Determinar el numero de participantes inscritos que obtuvieron un puntaje menor a 51 en cada municipio con nomDpto X
        System.out.println();
        puntajeMenor51(listaDobleDepartamentos, "Santa Cruz");
        
    }
    
    public static void sinInscritos(ListaSimpleCategorias listaSimpleCategorias, ListaDobleDepartamentos listaDobleDepartamentos, String X) {
        int c = 0;
        NodoSimpleCategorias nodoSimpleCategorias = listaSimpleCategorias.getNodo();
        while (nodoSimpleCategorias != null) { 
            NodoSimpleEspecialidades nodoSimpleEspecialidades = nodoSimpleCategorias.getListaSimpleEspecialidades().getNodo();
            while (nodoSimpleEspecialidades != null) {
                boolean b = false;                
                NodoDobleDepartamentos nodoDobleDepartamentos = listaDobleDepartamentos.getNodo();
                while (nodoDobleDepartamentos != null) {
                    if (nodoDobleDepartamentos.getNomDpto().equals(X)) {
                        NodoDobleMunicipios nodoDobleMunicipios = nodoDobleDepartamentos.getListaDobleMunicipios().getNodo();
                        while (nodoDobleMunicipios != null) {
                            NodoDobleInscritos nodoDobleInscritos = nodoDobleMunicipios.getListaDobleInscritos().getNodo();
                            while (nodoDobleInscritos != null) {
                                if (nodoDobleInscritos.getIdEsp() == nodoSimpleEspecialidades.getIdEsp()) {
                                    b = true;
                                }
                                nodoDobleInscritos = nodoDobleInscritos.getSig();
                            }
                            nodoDobleMunicipios = nodoDobleMunicipios.getSig();
                        }
                    }
                    nodoDobleDepartamentos = nodoDobleDepartamentos.getSig();
                }
                nodoSimpleEspecialidades = nodoSimpleEspecialidades.getSig();
                if (b == false) {
                    c ++;
                }
            }
            nodoSimpleCategorias = nodoSimpleCategorias.getSig();
        }
        System.out.println("La cantidad de especialidades sin participantes inscritos del departamento " + X + " es: " + c);
    }
    
    public static void menorPuntaje(ListaSimpleCategorias listaSimpleCategorias, ListaDobleDepartamentos listaDobleDepartamentos, String X) {
        System.out.println("Los nombres de los inscritos con el menor puntaje en la categoria " + X + " son:");
        NodoDobleDepartamentos nodoDobleDepartamentos = listaDobleDepartamentos.getNodo();
        while (nodoDobleDepartamentos != null) {            
            NodoDobleMunicipios nodoDobleMunicipios = nodoDobleDepartamentos.getListaDobleMunicipios().getNodo();
            while (nodoDobleMunicipios != null) {                
                NodoDobleInscritos nodoDobleInscritos = nodoDobleMunicipios.getListaDobleInscritos().getNodo();
                while (nodoDobleInscritos != null) {                    
                    NodoSimpleCategorias nodoSimpleCategorias = listaSimpleCategorias.getNodo();
                    while (nodoSimpleCategorias != null) {                        
                        if (nodoSimpleCategorias.getNomCat().equals(X)) {
                            if (nodoDobleInscritos.getPuntaje() == elMenorPuntaje(listaDobleDepartamentos, nodoSimpleCategorias)) {
                                System.out.println(nodoDobleInscritos.getNomIns());
                            }
                        }           
                        nodoSimpleCategorias = nodoSimpleCategorias.getSig();
                    }       
                    nodoDobleInscritos = nodoDobleInscritos.getSig();
                }   
                nodoDobleMunicipios = nodoDobleMunicipios.getSig();
            }
            nodoDobleDepartamentos = nodoDobleDepartamentos.getSig();
        }
    }
    
    public static int elMenorPuntaje(ListaDobleInscritos listaDobleInscritos, NodoSimpleCategorias nodoSimpleCategorias) {
        int m = 100;       
            NodoDobleInscritos nodoDobleInscritos = listaDobleInscritos.getNodo();
            while (nodoDobleInscritos != null) {                
                if (nodoSimpleCategorias.getIdCat() == nodoDobleInscritos.getIdCat() && nodoDobleInscritos.getPuntaje() < m) {
                    m = nodoDobleInscritos.getPuntaje();
                }
                nodoDobleInscritos = nodoDobleInscritos.getSig();
            }
        return m;
    }
    
    public static int elMenorPuntaje(ListaDobleDepartamentos listaDobleDepartamentos, NodoSimpleCategorias nodoSimpleCategorias) {
        int m = 100;   
        NodoDobleDepartamentos nodoDobleDepartamentos = listaDobleDepartamentos.getNodo();
        while (nodoDobleDepartamentos != null) {            
            NodoDobleMunicipios nodoDobleMunicipios = nodoDobleDepartamentos.getListaDobleMunicipios().getNodo();
            while (nodoDobleMunicipios != null) {                
                NodoDobleInscritos nodoDobleInscritos = nodoDobleMunicipios.getListaDobleInscritos().getNodo();
                while (nodoDobleInscritos != null) {                
                    if (nodoSimpleCategorias.getIdCat() == nodoDobleInscritos.getIdCat() && nodoDobleInscritos.getPuntaje() < m) {
                        m = nodoDobleInscritos.getPuntaje();
                    }
                    nodoDobleInscritos = nodoDobleInscritos.getSig();
                }   
                nodoDobleMunicipios = nodoDobleMunicipios.getSig();
            }
            nodoDobleDepartamentos = nodoDobleDepartamentos.getSig();
        }
        return m;
    }
    
    public static void puntajeMenor51(ListaDobleDepartamentos listaDobleDepartamentos, String X) {
        int c = 0;
        NodoDobleDepartamentos nodoDobleDepartamentos = listaDobleDepartamentos.getNodo();
        while (nodoDobleDepartamentos != null) {
            if (nodoDobleDepartamentos.getNomDpto().equals(X)) {
                NodoDobleMunicipios nodoDobleMunicipios = nodoDobleDepartamentos.getListaDobleMunicipios().getNodo();
                while (nodoDobleMunicipios != null) {                    
                    NodoDobleInscritos nodoDobleInscritos = nodoDobleMunicipios.getListaDobleInscritos().getNodo();
                    while (nodoDobleInscritos != null) {                        
                        if (nodoDobleInscritos.getPuntaje() < 51) {
                            c ++;
                        }   
                        nodoDobleInscritos = nodoDobleInscritos.getSig();
                    }
                    nodoDobleMunicipios = nodoDobleMunicipios.getSig();
                }
            }
            nodoDobleDepartamentos = nodoDobleDepartamentos.getSig();
        }
        System.out.println("El numero de participantes del departamento " + X + " con un puntaje menor a 51 es de: " + c);
    }
}
