import java.util.Scanner;
public class enesimo_primo {
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
		int n,a;
		Scanner sc=new Scanner(System.in);
		System.out.println("enter n");
		n=sc.nextInt();
		a=enesimo(n);
		System.out.println(a);
	}
}