import java.util.Scanner;
public class prueba {
	public static void main(String[] args) {
		int n,x=0;
		Scanner sc=new Scanner(System.in);
		System.out.println("enter tamaño del vector");
		n=sc.nextInt();//n es el tamaño del vector
		int v[]=new int[n];
		for(int i=0;i<n;i++) {
			v[i]=sc.nextInt();//ingresa cada valor en el vector
		}
//si el vector es impar
				//metodo burbuja
				for(int i=1;i<n-1;i++) {
					for(int j=i+1;i<n;i++) {
						if(v[i]%2!=0) {
						if(v[i]>v[j]) {
							x=v[j]; v[j]=v[i];v[i]=x;
						}
					}
					}
				}
			for(int i=0;i<n;i++) {
				System.out.println(v[i]);
			}
		}
	}

