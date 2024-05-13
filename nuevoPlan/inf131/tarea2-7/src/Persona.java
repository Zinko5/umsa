public class Persona {
    private String nom;
    private int edad;
    public int getEdad() {
        return edad;
    }
    public String getNom() {
        return nom;
    }
    public Persona(String nom, int edad){
        this.nom = nom;
        this.edad = edad;
    }
    public void mostrar(){
        System.out.println(this.nom + " " + this.edad);
    }
}
