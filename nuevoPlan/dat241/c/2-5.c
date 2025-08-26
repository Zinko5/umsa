#include "stdio.h"

void suma(int a, int b, int *c){
    *c = a + b;
}

void multiplicacion(int a, int b,  int *c){
    *c = 0;
    for (int i = 0; i < a; i++){
        suma(*c, b, c);
    }
}

void main(){
    int a, b, c;
    printf("Introcuzca dos números\n");
    scanf("%d", &a);
    scanf("%d", &b);
    multiplicacion(a, b, &c);
    printf("La multiplicación es %d \n", c);
}