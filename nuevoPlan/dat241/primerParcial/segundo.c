#include "stdio.h"
#include "pthread.h"

void *fib(void *args) {
    int n = *(int*) args;
    int a = 0, b = 1, fibo;
    printf("%d ", a);
    if (n > 1) printf("%d ", b);
    for (int i = 2; i < n; i++) {
        fibo = a + b;
        a = b;
        b = fibo;

        printf("%d ", fibo);
    }
    printf("\n");
}

int main() {
    pthread_t hilo1;
    int n;
    printf("Ingrese el valor de n: ");
    scanf("%d", &n);
    pthread_create(&hilo1, NULL, fib, &n);
    pthread_join(hilo1, NULL);
    return 0;
}