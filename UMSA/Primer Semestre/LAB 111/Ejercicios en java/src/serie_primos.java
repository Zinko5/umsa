import java.util.Scanner;
public class serie_primos {
	public static void main(String[] args) {
		int n;
		Scanner sc=new Scanner(System.in);
		System.out.println("enter n");
		n=sc.nextInt();
		int c = 0;//contador de primos
		int p = 2;//primos, inicia en 2 porque es el primer primo
		int d = 2;//divide a partir del 2 para ver si es divisor(primo)
		while (c < n) {//para que nos muestre hasta n cantidad
		   if (p % d == 0) {//si p tiene un divisor a partir del 2
		      if (p == d) {//si el unico divisor de p es p, significa que p es primo
		         System.out.print(p + ", ");
		         c++;//como aparecio un primo, el contador aumenta
		      }
		      d = 2;//d se reinicia
		      p++;//el numero que queremos saber si es primo aumenta
		   }
		   else
		      d++;//el divisor d va aumentando hasta que divida exactamente a p
		}
	}
}