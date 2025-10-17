#include "stdio.h"
#include "omp.h"
#include "math.h"

void main() {
    int n;
    printf("Ingrese n\n");
    scanf("%d", &n);
    int serie[n];
    omp_set_num_threads(4);
    double ro = (1 + sqrt(5)) / 2;
    int i;
    #pragma omp parallel shared(serie, n, ro) private(i)
    {
        #pragma omp for
        for (i = 0; i < n; i++) {
            serie[i] = (int)((pow(ro, i) - pow(-ro, -i)) / sqrt(5));
        }
    }
    for (i = 0; i < n; i++) {
        printf("%d ", serie[i]);
    }
    printf("\n");
}