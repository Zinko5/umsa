#include "stdio.h"
#include "omp.h"

void main() {
    int i, suma;
    omp_set_num_threads(4);
    #pragma omp parallel shared(i) reduction(+: suma)
    {
        int procesador, c_procesadores;

        c_procesadores = omp_get_num_threads();
        procesador = omp_get_thread_num();

        printf("Ejecutando procesador %d de %d procesadores\n", procesador, c_procesadores);

        #pragma omp for
        for (i = 0; i < 100; i++)
        {
            suma ++;
        }
    }
    printf("suma %d\n", suma);
}