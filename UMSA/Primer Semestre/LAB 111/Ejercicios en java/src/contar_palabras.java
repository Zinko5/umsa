import java.util.Scanner;
public class contar_palabras {
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
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		String c;
		int p;
		System.out.println("enter cadena");
		c=sc.nextLine();
		p=contarpalabras(c);
		System.out.println(+p+" palabras");
	}
}