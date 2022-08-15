import java.util.Scanner;
public class ordenar {
	static public int v[]=new int[20];
	static void burbuja(int t) {
		int i,j,x=0;
		for(i=1;i<=t-1;i++) {//se daran varios recorridos para comparar cada caso
			for(j=i+1;j<=t;j++) {//recorreremos el vector comparando cada valor con el siguiente 
				if(v[i]%2!=0 && v[j]%2!=0) {//condicion para que solo aplique a los vectores impares, se puede eliminar o modificar
					if(v[i]>v[j]) {//si el primer valor es mayor, se intercambiaran sus posiciones
						x=v[j];v[j]=v[i];v[i]=x;
					}
				}
			}
		}
	}
	static public void llenar(int t) {
		Scanner sc=new Scanner(System.in);
		for(int i=0;i<t;i++) {
			System.out.println("v["+i+"]: ");
			v[i]=sc.nextInt();
		}
	}
	static public void mostrar(int t) {
		for(int i=0;i<t;i++) {
			System.out.println("v["+i+"]:"+"\n"+v[i]);
		}
	}
 	public static void main(String[] args) {
		int n;
		Scanner sc=new Scanner(System.in);
		do {
		System.out.println("enter tamaño del vector");
		n=sc.nextInt();//n es el tamaño del vector
		}while(n>20);
			llenar(n);
			burbuja(n);
			System.out.println("\n"+"si ordenamos los impares del vector:" +"\n");
			mostrar(n);
	}
}