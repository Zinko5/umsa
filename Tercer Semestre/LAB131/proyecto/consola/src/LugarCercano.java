public class LugarCercano {
    private String nombre;
    private String tipo;
    private String horarioAtencion;

    public LugarCercano() {
    }

    public LugarCercano(String nombre, String tipo, String horarioAtencion) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.horarioAtencion = horarioAtencion;
    }

    public void Leer() {
        System.out.println("<Lectura de Lugar Cercano>");

        System.out.print("Ingrese el nombre: ");
        nombre = Leer.dato();

        System.out.print("Ingrese el tipo: ");
        tipo = Leer.dato();

        System.out.print("Ingrese el horario de atención: ");
        horarioAtencion = Leer.dato();

        //scanner.close();
    }

    public void Mostrar() {
        System.out.println("Nombre: " + nombre + ", Tipo: " + tipo + ", Horario de Atención: " + horarioAtencion);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getHorarioAtencion() {
        return horarioAtencion;
    }

    public void setHorarioAtencion(String horarioAtencion) {
        this.horarioAtencion = horarioAtencion;
    }
}
