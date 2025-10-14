#include "stdio.h"
#include "omp.h"

int main() {
    int n;
    printf("n: ");
    scanf("%d", &n);

    omp_set_num_threads(4);
    int fibo = 0, a = 0, b = 1;
    
    #pragma omp parallel shared(n, fibo, a, b)
    {
        #pragma omp single
        {
            if (n <= 1) fibo = n;
            else {
                for (int i = 2; i < n; i++) {
                    fibo = a + b;
                    a = b;
                    b = fibo;
                }
            }
        }
    }
    
    printf("El termino %d es: %d\n", n, fibo);
}

// 1.- 0
// 2.- 1
// 3.- 1
// 4.- 2
// 5.- 3
// 6.- 5
// 7.- 8
// 8.- 13
// 9.- 21
// 10.- 34