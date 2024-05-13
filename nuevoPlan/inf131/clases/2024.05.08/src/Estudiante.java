public class Estudiante {
    private String nom;
    private int edad;
    public int getEdad() {
        return edad;
    }
    public void setEdad(int edad) {
        this.edad = edad;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public Estudiante(){

    }
    public Estudiante(String nom, int edad){
        this.nom = nom;
        this.edad = edad;
    }
    public String toString(){
        return "[" + nom + " " + edad + "]";
    }
}
