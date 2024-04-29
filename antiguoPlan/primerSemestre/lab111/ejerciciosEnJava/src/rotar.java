import java.util.Scanner;
public class rotar {
	public static int v[]=new int [20];
	static public void llenar(int t) {
		Scanner sc=new Scanner(System.in);
		for(int i=0;i<t;i++) {
			System.out.println("v["+i+"]:");
			v[i]=sc.nextInt();
		}
	}
	static public void mostrar(int t) {
		for(int i=0;i<t;i++) {
			System.out.println("v["+i+"]:"+"\n"+v[i]);
		}
	}
	static public void rotarv(int t) {
		int k=0,p=0,x=0,y=0;
		for(int i=t-1;i>=0;i--) {//para rotar a la izquierda. si queremos rotar a la derecha se hace (int i=0;i<n;i++)
			//si solo quisieramos rotar algunos indices del vector, aqui iria otro if con la condicion para los valores o indices
			if(k==0) {//esto solo pasa la primera vez, almacena en p el indice del extremo que se cambiara al final y el indice a rotar en x
				p=i;x=v[i];k=1;
			}
			else {//aqui intercambia el valor que registramos en x con el siguiente indice y vuelve a almacenar en x
				y=v[i];v[i]=x;x=y;
			}
		}
		if(k==1) { //esto ocurre al final, ahora el indice que almacenamos en p se intercambia 
			v[p]=x;
		}
	}
	public static void main(String[] args) {
		int n;
		Scanner sc=new Scanner(System.in);
		do {
			System.out.println("enter tamaño del vector");
			n=sc.nextInt();
		}while(n>20);
		llenar(n);
		System.out.println("\n");
		mostrar(n);
		rotarv(n);
		System.out.println("\n");
		System.out.println("si rotamos el vector:");
		System.out.println("\n");
		mostrar(n);
	}
}