#include "stdio.h"
#include "pthread.h"
#include "math.h"

int n;
int serie[100];
double ro;

void *calcularFibonacci(void *arg) {
    int i = *(int*)arg;
    serie[i] = (int)((pow(ro, i) - pow(-ro, -i)) / sqrt(5));
}

void main() {
    printf("Ingrese n\n");
    scanf("%d", &n);
    ro = (1 + sqrt(5)) / 2;
    pthread_t hilos[100];
    int indices[100];
    for (int i = 0; i < n; i++) {
        indices[i] = i;
        pthread_create(&hilos[i], NULL, calcularFibonacci, &indices[i]);
    }
    for (int i = 0; i < n; i++) {
        pthread_join(hilos[i], NULL);
    }
    for (int i = 0; i < n; i++) {
        printf("%d ", serie[i]);
    }
    printf("\n");
}