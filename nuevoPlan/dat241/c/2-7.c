#include "stdio.h"

void suma(int a, int b, int *c){
    *c = a + b;
}

void resta(int a, int b, int *c){
    *c = a - b;
}

void multiplicacion(int a, int b,  int *c){
    *c = 0;
    for (int i = 0; i < a; i++){
        suma(*c, b, &*c);
    }
}

void main(){
    int a, b, c, d;
    printf("Introcuzca dos números\n");
    scanf("%d", &a);
    scanf("%d", &b);
    printf("¿Qué operación realizará?\n1.- suma 2.- resta 3.- multiplicación\n");
    scanf("%d", &c);
    if (c == 1) {
        suma(a, b, &d);
        printf("La suma es %d\n", d);
    } else if (c == 2) {
        resta(a, b, &d);
        printf("La resta es %d\n", d);
    } else if (c == 3) {
        multiplicacion(a, b, &d);
        printf("La multiplicación es %d\n", d);
    }
}