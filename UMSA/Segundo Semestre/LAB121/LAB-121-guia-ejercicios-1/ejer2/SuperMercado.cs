namespace ejer2 {
    class SuperMercado {
        private string nombre, direccion;
        private int nroProductos;
        private string [,]productos = new string [50,3];//nombre, stock, precio
        public SuperMercado() {
            nombre = "Ketal";
            direccion = "Av. Feliz";
            nroProductos = 2;
            productos [0,0] = "mochila";
            productos [0,1] = "10"; 
            productos [0,2] = "100";
            productos [1,0] = "jabon";
            productos [1,1] = "30";
            productos [1,2] = "15";
        }
        public SuperMercado(string a) {
            nombre = a;
            direccion = "calle suiza";
            nroProductos = 2;
            productos [0,0] = "jabon";
            productos [0,1] = "50";
            productos [0,2] = "10";
            productos [1,0] = "mochila";
            productos [1,1] = "5";
            productos [1,2] = "160";
        }
        public void mostrar() {
            Console.WriteLine(nombre + " " + direccion + " " + nroProductos);
            for (int i = 0; i < nroProductos; i++) {
                Console.WriteLine(productos [i,0] + " " + productos [i,1] + " " + productos [i,2]);
            }
        }
        public void masstock(string x, SuperMercado a) {
            string a1 = "", a2 = "";
            for (int i = 0; i < nroProductos; i++) {
                if (productos [i,0] == x) {
                    a1 = productos [i,1];
                }
                if (a.productos [i,0] == x) {
                    a2 = a.productos [i,1];
                }
            }
            if (Int16.Parse(a1) > Int16.Parse(a2)) {
                Console.WriteLine(nombre + " tiene mas stock (" + a1 + ") de " + x + " que " + a.nombre + " (" + a2 + ")");
            }
            else {
                Console.WriteLine(a.nombre + " tiene mas stock (" + a2 + ") de " + x + " que " + nombre + " (" + a1 + ")");
            }
        }
        public void masbaratos(SuperMercado y) {
            for (int yi = 0; yi < nroProductos; yi++) {
                for (int i = 0; i < y.nroProductos; i++) {
                    if (productos [yi,0] == y.productos[i,0] && Int16.Parse(productos[yi,2]) < Int16.Parse(y.productos[i,2])) {
                        Console.WriteLine(productos [yi,0] + " es mas barato (" + productos[yi,2] + ") en " + nombre + " que en " + y.nombre + " (" + y.productos[i,2] + ")");
                    }
                }
            }
        }
        public void disponible(string x) {
            for (int i = 0; i < nroProductos; i++) {
                if (productos [i,0] == x) {
                    if(Int16.Parse(productos[i,1]) > 0) {
                        Console.WriteLine(nombre + " tiene stock disponible de " + productos[i,0]);
                    }
                    else {
                        Console.WriteLine(nombre + " no tiene stock disponible de " + productos[i,0]);
                    }
                }
            }
        }
    }
}