public class Def_Inf {
    private int nro, nota;
    private String tema, nombre;

    public int getNro() {
        return nro;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    

    public void setNro(int nro) {
        this.nro = nro;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public Def_Inf(int nro, int nota, String tema, String nombre) {
        this.nro = nro;
        this.nota = nota;
        this.tema = tema;
        this.nombre = nombre;
    }

    public Def_Inf() {
    }
    public void mostrar() {
        System.out.print(nro + ", " + nota + ", " + tema + ", " + nombre);
    }
}