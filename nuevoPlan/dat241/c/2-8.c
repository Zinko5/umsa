#include "stdio.h"
#include "omp.h"

int k = 0;
void main() {
    #pragma omp parallel
    {
        int procesadores = omp_get_num_threads();
        int procesador = omp_get_thread_num();
        printf("Procesador %d de %d procesadores\n", procesador, procesadores);
        printf("El valor de k es: %d\n", k);
        k ++;
    }
    printf("El valor de k es: %d\n", k);
}