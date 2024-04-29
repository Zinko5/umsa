import java.util.Scanner;
public class MyPlayLists {
    Scanner sc = new Scanner(System.in);
    private int nroPlayLists;
    private PlayList []playLists = new PlayList[50];
    public int getNroPlayLists() {
        return nroPlayLists;
    }
    public void setNroPlayLists(int nroPlayLists) {
        this.nroPlayLists = nroPlayLists;
    }
    public PlayList[] getPlayLists() {
        return playLists;
    }
    public void setPlayLists(PlayList[] playLists) {
        this.playLists = playLists;
    }
    public MyPlayLists() {
    }
    public void Leer() {
        System.out.print("Leyendo my playlists: ");
        System.out.print("Leer numero de playlists: ");
        nroPlayLists = sc.nextInt();
        for (int i = 0; i < nroPlayLists; i++) {
            playLists[i] = new PlayList();
            playLists[i].Leer();   
        }
    }
    public void Mostrar() {
        System.out.print("Mostrando my playlist: ");
        System.out.println(nroPlayLists);
        for (int i = 0; i < nroPlayLists; i++) {
            playLists[i].Mostrar();
        }
    }
    public void MostrarM() {
        System.out.print("Mostrando playlists con mayor numero de canciones: ");
        int m = 0;
        for (int i = 0; i < nroPlayLists; i++) {
            if (playLists[i].getNroCanciones() > m) {
                m = playLists[i].getNroCanciones();
            }
        }
        for (int i = 0; i < nroPlayLists; i++) {
                if (playLists[i].getNroCanciones() == m) {
                    playLists[i].Mostrar();
                }
        }
    }
    public void Verificar(String X) {
        boolean c = false;
        for (int i = 0; i < nroPlayLists; i++) {
            if (playLists[i].Verificar(X)) {
                c = true;
            }
        }
        if (c) {
            System.out.println("Existe una cancion del artista " + X);
        }
    }
    public void MostrarG(String X) {
        for (int i = 0; i < nroPlayLists; i++) {
            System.out.println("playlist " + i + " tiene " + playLists[i].Genero(X) + " canciones de genero " + X);
        }
    }
    public void Ordenar() {
        System.out.println("Ordenando las canciones por duracion");
        for (int i = 0; i < nroPlayLists; i++) {
            playLists[i].Ordenar();
        }
    }
}
