import java.util.Scanner;
public class serie_clasica {
	static int enesimo(int n) {
		int k=2,c = 1,p=2,d=2;
		while (c <= n) {
		   if (p % d == 0) {
		      if (p == d) {
		    	  //p es primo
		    	  k=p;
		         c++;
		      }
		      d = 2;
		      p++;
		   }
		   else
		      d++;
		}
		return k;
	}
	public static void main(String[] args) {
		int n,v=2,c=0,c2=1;//v es donde empezara la serie
		Scanner sc=new Scanner(System.in);
		System.out.println("enter n");
		n=sc.nextInt();
		for(int i=0;i<n;i++) {//de 0 hasta la cantidad deseada
			System.out.println(v);
			c=c+1;//el contador de veces que v no cambia
			if(c==v) {
				c2++;v=enesimo(c2); c=0;//lo que se suma a v es el rango de la serie
			}
		}
	}
}