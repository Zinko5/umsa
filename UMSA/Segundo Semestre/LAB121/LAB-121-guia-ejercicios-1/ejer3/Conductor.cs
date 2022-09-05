namespace ejer3 {
    class Conductor {
        private int ci, nroVehiculos;
        private string nombre;
        private string []placasV = new string [50];
        public Conductor() {
            ci = 1848;
            nombre = "Rodolfo";
            nroVehiculos = 2;
            placasV[0] = "FJHS18";
            placasV[1] = "FUWS45";
        }
        public Conductor(string n) {
            ci = 21891;
            nombre = n;
            nroVehiculos = 2;
            placasV[0] = "KFYH8948";
            placasV[1] = "FUWS45";
        }
        public int getCi() {
            return ci;
        }
        public void vehiculosdeci(Vehiculo v1, Vehiculo v2, Vehiculo v3) {
            Console.WriteLine("El conductor de CI " + ci + " tiene los siguientes vehiculos: ");
            for (int i = 0; i < nroVehiculos; i++) {
                if (placasV[i] == v1.getPlaca()) {
                    v1.mostrar();
                }
                if (placasV[i] == v2.getPlaca()) {
                    v2.mostrar();
                }
                if (placasV[i] == v3.getPlaca()) {
                    v3.mostrar();
                }
            }
        }
        public string getPlacaC(int x){
            return placasV[x];
        }
        public int getNro() {
            return nroVehiculos;
        }
        public string getNombre() {
            return nombre;
        }
        public void citipo(Vehiculo v1, Vehiculo v2, Vehiculo v3) {
            for(int i = 0; i < nroVehiculos; i++) {
                if (placasV[i] == v1.getPlaca() && v1.getTipo() == "camioneta") {
                    Console.WriteLine(nombre + " tiene una camioneta con placa " + v1.getPlaca());
                }
                if (placasV[i] == v2.getPlaca() && v2.getTipo() == "camioneta") {
                    Console.WriteLine(nombre + " tiene una camioneta con placa " + v2.getPlaca());
                }
                if (placasV[i] == v3.getPlaca() && v3.getTipo() == "camioneta") {
                    Console.WriteLine(nombre + " tiene una camioneta con placa " + v3.getPlaca());
                }
            }
        }
    }
}