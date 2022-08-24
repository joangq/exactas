#include <stdio.h>
#include "funcit.h"
#include "funcrec.h"

int main() {
    
    int max_fib = 10;
    int max_imp = 10;
    int max_div = 11;
    int max_nck = 10;
    int n_ncm   = max_nck-1;
    
    // Fibonacci
    printf("\nNúmeros de Fibonacci:\n");
    for(int i = 0; i < max_fib; i++) {
        printf("F_%d = %d  |  F_%d = %d\n", i, fibonacciRecursivo(i), i, fibonacciIterativo(i));
    }
    
    // Suma impares
    printf("\nSuma de Impares:\n");
    for(int i = 0; i < max_imp; i++) {
        printf("sI(%d) = %d  |  sI(%d) = %d\n", i, sumaImparesRecursiva(i), i, sumaImparesIterativa(i));
    }
    
    // Suma divisores
    printf("\nSuma de Divisores:\n");
    for(int i = 1; i < max_div; i++) {
        printf("sD(%d) = %d  |  sD(%d) = %d\n", i, sumaDivisoresRecursiva(i), i, sumaDivisoresIterativa(i));
    }
    
    // Número combinatorio
    printf("\nNúmero combinatorio:\n");
    for(int i = 0; i < max_nck; i++) {
        printf("nC(%d, %d) = %d  |  nC(%d, %d) = %d\n", n_ncm, i, numeroCombinatorioRecursivo(n_ncm, i), n_ncm, i, numeroCombinatorioIterativo(n_ncm, i));
    }
    
    return 0;
}
