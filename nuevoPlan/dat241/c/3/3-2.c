#include "stdio.h"
#include "omp.h"

void main() {
    int procesador, c_procesadores;
    omp_set_num_threads(4);
    int c = 0;
    #pragma omp parallel
    {
        c_procesadores = omp_get_num_threads();
        procesador = omp_get_thread_num();
        printf("Ejecutando procesador %d de %d procesadores\n", procesador, c_procesadores);
        printf("Contador: %d\n", c);
        c ++;
    }
    printf("------\nContador: %d\n", c);
}