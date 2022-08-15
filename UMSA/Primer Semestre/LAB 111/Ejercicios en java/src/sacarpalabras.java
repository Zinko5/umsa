import java.util.Scanner;
public class sacarpalabras {
	static int contarpalabras(String n) {
		int l,c=0;
		String a;
		n=n+" ";
		l=n.length();
		for(int i=0;i<l;i++) {
			a=n.substring(i,i+1);
			if(a.compareTo(" ")==0) {
				c=c+1;
			}
		}
		return c;
	}
	static String sacarpalabra(String c, int n) {//c es la oracion y n el indice de la palabra a sacar
		int l,p=0;//p es el indice de la palabra
		n=n+1;
		String a,m="",z="";
		c=c+" ";
		l=c.length();
		for(int i=0;i<l;i++) {
			a=c.substring(i,i+1);//se repasa letra por letra
			if(a.compareTo(" ")==0) {
				/*si no hay un espacio, se forma la palabra en m, si hay un espacio se suma una palabra
				 * en p, pregunta si esa es la palabra que se quiere, si lo es se almacenara en z,
				 * despues se reiniciara m borrando lo que contenga
				*/
				p=p+1;//si la letra es un espacio, en p se sumara un indice de palabra
				if(p==n) {
					z=m;/*si el indice de la palabra p coincide con el indice de palabra n,
					la palabra almacenada en m se almacenara en z
					*/
				}
				m="";//se reinicia m
			}
			else {//si la letra no es un espacio, en m se ira formando la palabra letra por letra
				m=m+a;
			}
		}
		return z;
	}
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String c,a;
		int p;
		System.out.println("enter cadena");
		c=sc.nextLine();//c es la cadena
		p=contarpalabras(c);//p es la cantidad de palabras
		String v[]=new String[p];//el vector v es del tamaño de la cantidad de palabras
		for(int i=0;i<p;i++) { 
			a=sacarpalabra(c,i);//se pasa cada palabra en a
			v[i]=a;//se almacena cada palabra en el vector v
			System.out.println("v["+i+"] :"+v[i]);//se muestra el vector v
		}
	}
}