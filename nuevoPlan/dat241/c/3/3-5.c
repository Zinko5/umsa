#include "stdio.h"
#include "omp.h"

void main() {
    omp_set_num_threads(4);
    int i, j = 0;
    #pragma omp parallel shared(i) private(j)
    {
        int procesador, c_procesadores;

        c_procesadores = omp_get_num_threads();
        procesador = omp_get_thread_num();

        printf("Ejecutando procesador %d de %d procesadores\n", procesador, c_procesadores);
        printf("i: %d, j:%d\n", i, j);
        i ++;
        j ++;
    }
}