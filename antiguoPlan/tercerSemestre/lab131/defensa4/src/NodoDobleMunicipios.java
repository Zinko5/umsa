public class NodoDobleMunicipios {
    private int idMun;
    private String nomMun;
    private ListaDobleInscritos listaDobleInscritos;

    public int getIdMun() {
        return idMun;
    }

    public void setIdMun(int idMunicipios) {
        this.idMun = idMunicipios;
    }

    public String getNomMun() {
        return nomMun;
    }

    public void setNomMun(String nomMun) {
        this.nomMun = nomMun;
    }

    public ListaDobleInscritos getListaDobleInscritos() {
        return listaDobleInscritos;
    }

    public void setListaDobleInscritos(ListaDobleInscritos listaDobleInscritos) {
        this.listaDobleInscritos = listaDobleInscritos;
    }
    
    private NodoDobleMunicipios ant, sig;

    NodoDobleMunicipios(){
        ant = sig = null;
    }


    public NodoDobleMunicipios getAnt() {
        return ant;
    }

    public void setAnt(NodoDobleMunicipios ant) {
        this.ant = ant;
    }

    public NodoDobleMunicipios getSig() {
        return sig;
    }

    public void setSig(NodoDobleMunicipios sig) {
        this.sig = sig;
    }
}
