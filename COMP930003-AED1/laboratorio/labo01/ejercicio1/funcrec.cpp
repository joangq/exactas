/* Implementación recursiva de las funciones del ejercicio 1 */

int fibonacciRecursivo(int n) {
    switch(n) {
        case 0:
            return 0;
            break;
        
        case 1:
            return 1;
            break;
        
        default:
            return fibonacciRecursivo(n-2) + fibonacciRecursivo(n-1);
            break;
    }
}

int sumaImparesRecursiva(int n) {
    if (n < 1) { return 0; }
    else if (n == 2) { return 1; }
    else if (n == 4) { return 4; }
    else {
        switch(n % 2) {
            case 0: // n par
                return (n-1) + sumaImparesRecursiva(n-1);
                break;
            
            case 1: // n impares
                return sumaImparesRecursiva(n-1);
                break;
        }
    }
}

// Auxiliar de sumaDivisoresRecursiva
int divisoresHasta(int num, int x) {
    if(x == 1)            { return 1; } 
    else if (num%x == 0)  { return x + divisoresHasta(num, x-1); } 
    else                  { return     divisoresHasta(num, x-1); }
}

int sumaDivisoresRecursiva(int n) {
    return divisoresHasta(n, n);
}

// nC(n,k) = nC(n-1, k) + nC(n-1, k-1)
int numeroCombinatorioRecursivo(int n, int k) {
    if(n < k) { return -1; }
    
    if (k == n || k == 0) { return 1; }
    else if (k == n-1 || k == 1) { return n; }
    else {
        return numeroCombinatorioRecursivo(n-1, k) +
               numeroCombinatorioRecursivo(n-1, k-1);
    }
}
