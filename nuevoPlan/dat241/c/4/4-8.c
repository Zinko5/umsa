#include "stdio.h"
#include "pthread.h"

void *funcionParalela(void *args) {
    int *numeros = (int*) args;
    numeros[2] = numeros[1] + numeros[0];
}

void main() {
    pthread_t hilo1;

    int valores[3];
    valores[0] = 6;    
    valores[1] = 7;
    valores[2] = 0;

    pthread_create(&hilo1, NULL, funcionParalela, valores);
    pthread_join(hilo1, NULL);
    printf("%d \n", valores[2]);
}