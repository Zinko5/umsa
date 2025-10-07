#include "stdio.h"
#include "omp.h"

void main() {
    int procesador, c_procesadores;
    #pragma omp parallel
    {
        c_procesadores = omp_get_num_threads();
        procesador = omp_get_thread_num();
        printf("Ejecutando procesador %d de %d procesadores\n", procesador, c_procesadores);
    }
}