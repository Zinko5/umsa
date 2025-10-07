#include "stdio.h"
#include "omp.h"

void main() {
    omp_set_num_threads(4);
    #pragma omp parallel
    {
        int procesador, c_procesadores;
        c_procesadores = omp_get_num_threads();
        procesador = omp_get_thread_num();
        printf("Ejecutando procesador %d de %d procesadores\n", procesador, c_procesadores);
        #pragma omp for
        for (int i = 0; i < 5; i++)
        {
            printf("%d\n\n", i);
        }       
    }

    printf("-----------------\n\n");

    #pragma omp parallel for
        for (int i = 0; i < 5; i++)
        {
            printf("Ejecutando procesador %d de %d procesadores\n", omp_get_thread_num(), omp_get_num_threads());
            printf("%d\n\n", i);
        }       
}