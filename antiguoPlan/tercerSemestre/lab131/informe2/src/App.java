public class App {
    public static void main(String[] args) throws Exception {
        Libro lib = new Libro("El Quijote", "Miguel de Cervantes", 0, 5);
        Libro lib1 = new Libro("La Odisea", "Homero", 1, 3);
        Libro lib2 = new Libro("1984", "George Orwell", 2, 7);
        Libro lib3 = new Libro("La Celestina", "Fernando de Rojas", 3, 2);
        Libro lib4 = new Libro("Don Juan Tenorio", "Jose Zorrilla", 4, 4);
        Libro lib5 = new Libro("La Iliada", "Homero", 5, 1);
        Libro lib6 = new Libro("El amor en los tiempos del cólera", "Gabriel García Márquez", 6, 2);
        Libro lib7 = new Libro("La Divina Comedia", "Dante Alighieri", 7, 9);
        Libro lib8 = new Libro("La casa de Bernarda Alba", "Federico García Lorca", 8, 3);
        Libro lib9 = new Libro("El Lazarillo de Tormes", "Autor Anónimo", 9, 8);
        Libro lib10 = new Libro("Crónica de una muerte anunciada", "Gabriel García Márquez", 10, 2);
        Libro lib11 = new Libro("El coronel no tiene quien le escriba", "Gabriel García Márquez", 11, 2);
        Libro lib12 = new Libro("La ciudad y los perros", "Mario Vargas Llosa", 12, 5);

        Multipila mltipilalib = new Multipila();
        mltipilalib.setNp(3);
        mltipilalib.adicionar(1, lib);
        mltipilalib.adicionar(1, lib1);
        mltipilalib.adicionar(1, lib2);
        mltipilalib.adicionar(1, lib3);
        mltipilalib.adicionar(1, lib4);
        mltipilalib.adicionar(2, lib5);
        mltipilalib.adicionar(2, lib6);
        mltipilalib.adicionar(2, lib7);
        mltipilalib.adicionar(3, lib8);
        mltipilalib.adicionar(3, lib9);
        mltipilalib.adicionar(3, lib10);
        mltipilalib.adicionar(3, lib11);
        mltipilalib.adicionar(3, lib12);
        mltipilalib.mostrar();
        System.out.println("Eliminando los libros con stock cero:");
        eliminarStock(mltipilalib, 0);
        mltipilalib.mostrar();
        System.out.println("Mostrando solo las pilas con libros escritos por Homero:\n");
        mostrar(mltipilalib, "Homero");
        System.out.println("Numero de pila donde esta el libro La Divina Comedia del autor Dante Alighieri:");
        mostrar(mltipilalib, "La Divina Comedia", "Dante Alighieri");
    }
    public static void eliminarStock(Multipila mltpilalib, int x) {
        int itr = mltpilalib.getNp() + 1;
        for (int i = 1; i < itr; i++) {
            Pila pilalib = new Pila();
            while (!mltpilalib.esvacia(i)) {
                Libro libaux = mltpilalib.eliminar(i);
                if (libaux.getStock() != 0) {
                    pilalib.adicionar(libaux);   
                }
            }
            mltpilalib.vaciar(i, pilalib);
        }
    }
    public static void mostrar(Multipila mltipilalib, String x) {
        int itr = mltipilalib.getNp() +1;
        for (int i = 1; i < itr; i++) {
            Boolean c =  false;
            Pila pilalib = new Pila();
            while (!mltipilalib.esvacia(i)) {
                Libro libaux = mltipilalib.eliminar(i);
                if (libaux.getAutor().equals(x)) {
                    c = true;
                }
                pilalib.adicionar(libaux);
            }
            mltipilalib.vaciar(i, pilalib);
            if (c) {
                mltipilalib.mostrar(i);
            }
        }
    }
    public static void mostrar(Multipila mltpilalib, String x, String y) {
        int itr = mltpilalib.getNp() + 1;
        for (int i = 1; i < itr; i++) {
            Boolean c = false;
            Pila pilalib = new Pila();
            while (!mltpilalib.esvacia(i)) {
                Libro libaux = mltpilalib.eliminar(i);
                if (libaux.getTitulo().equals(x) && libaux.getAutor().equals(y)) {
                    c = true;
                }
                pilalib.adicionar(libaux);   
            }
            mltpilalib.vaciar(i, pilalib);
            if (c) {
                System.out.println(i);
            }
        }
    }
}
