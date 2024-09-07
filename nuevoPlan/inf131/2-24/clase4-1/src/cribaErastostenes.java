public class cribaErastostenes {
    public static void main(String[] args) {
        int max = 100;
        boolean[] primo = new boolean[max];
        for (int i = 0; i < max; i++) {
            primo[i] = true;
        } 
        primo[0] = false;
        primo[1] = false;
        for (int j = 2; j < max; j++) {
            if (primo[j]) {
                for (int j2 = j + j; j2 < max; j2 = j2 + j) {
                    primo[j2] = false;
                }
            }
        }
        int c = 1;
        for (int i = 2; i < max; i++) {
            if (primo[i]) {                
                System.out.println("primo nro " + c + ": " + i);
                c++;
            }
        }

        // mostrar primos por rango

        int cnt = 0;
        int a = 0;
        int b = 99;
        for (int i = a; i < b; i++) {
            if (primo[i]) {
                cnt ++;
            }
        }
        System.out.println("nro de " + cnt + " primos en el rango de a = " + a + " y b = " + b);

    }
}
