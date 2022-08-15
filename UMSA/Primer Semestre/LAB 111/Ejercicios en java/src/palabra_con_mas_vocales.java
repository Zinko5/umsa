import java.util.Scanner;
public class palabra_con_mas_vocales {
	static String sacar(String c, int n) {
		int l,e=0;
		String p,m="",z="";
		n++;
		c=c+" ";
		l=c.length();
		for(int i=0;i<l;i++) {
			p=c.substring(i,i+1);
			if(p.compareTo(" ")==0) {
				e++;
				if(e==n) {
					z=m;
				}
				m="";
			}
			else {
				m=m+p;
			}
		}
		return z;
	}
	static int contar(String c) {
		int co=0,l;
		String a;
		c=c+" ";
		l=c.length();
		for(int i=0;i<l;i++) {
		a=c.substring(i,i+1);
			if(a.compareTo(" ")==0) {
			co++;
			}
		}
		return co;
	}
	static int vocales(String c) {
		int l,v=0;
		String a;
		l=c.length();
		for(int i=0;i<l;i++) {
			a=c.substring(i, i+1);
			if(a.compareTo("a")==0 || a.compareTo("e")==0 || a.compareTo("i")==0 || a.compareTo("o")==0 || a.compareTo("u")==0) {
				v++;
			}
		}
		return v;
	}
	public static void main(String[] args) {
		String c,z="";
		int p,m=0;
		Scanner sc=new Scanner(System.in);
		System.out.println("enter cadena");
		c=sc.nextLine();
		p=contar(c);
		String v[]=new String[p];
		int u[]=new int[p];
		for(int i=0;i<p;i++) {
			v[i]=sacar(c,i);
			u[i]=vocales(v[i]);
		}
		for(int i=0;i<p;i++) {
			if(m<=u[i]) {
				m=u[i];
				z=v[i];
			}
		}
		System.out.println(z);
	}
}