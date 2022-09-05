namespace ejer3 {
    class Vehiculo {
        private string placa, marca, modelo, tipo;
        private double precio;
        public Vehiculo() {
            placa = "FJHS18";
            marca = "Nissan";
            modelo = "Seat Ibiza";
            tipo = "automovil";
            precio = 1503.8;
        }
        public Vehiculo(string t) {
            placa = "FUWS45";
            marca = "Toyota";
            modelo = "Opel Astra";
            tipo = t;
            precio = 1895.6;
        }
        public Vehiculo(string p, double d) {
            placa = p;
            marca = "Suzuki";
            modelo = "Fiat Panda";
            tipo = "automovil";
            precio = d;
        }
        public string getPlaca() {
            return placa;
        }
        public void mostrar() {
            Console.WriteLine(placa + " " + marca + " " + modelo + " " + tipo + " " + precio);
        }
        public void conductordeplaca(Conductor c1, Conductor c2) {
            for (int i = 0; i < c1.getNro(); i++) {
                if (placa == c1.getPlacaC(i)) {
                    Console.WriteLine(c1.getNombre() + " maneja el vehiculo con placa " + placa);
                }
            }
            for (int i = 0; i < c2.getNro(); i++) {
                if (placa == c2.getPlacaC(i)) {
                    Console.WriteLine(c2.getNombre() + " maneja el vehiculo con placa " + placa);
                }
            }
        }
        public string getTipo() {
            return tipo;
        }
    }
}