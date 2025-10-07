#include "stdio.h"
#include "pthread.h"

void *funcionParalela(void *arg) {
    printf("Hilo\n");
}

void main() {
    pthread_t hilo1;
    pthread_create(&hilo1, NULL, funcionParalela, NULL);
    printf("Hola Mundo\n");
    pthread_join(hilo1, NULL);
}