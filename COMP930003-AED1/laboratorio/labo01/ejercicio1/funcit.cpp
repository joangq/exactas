/* Implementación iterativa de las funciones del ejercicio 1 */

int fibonacciIterativo(int n) {
    int prev = 0;
    int current = 1;
    int result = 0;
    for(int i = 0; i < n; i++) {
        prev = current;
        current = result;
        result = prev + current;
    }
    return result;
}

int sumaImparesIterativa(int n) {
    int result = 0;
    for(int i = 0; i < n; i++) if (i%2 == 1) result += i;
    return result;
}

int sumaDivisoresIterativa(int n) {
    int result = 0;
    for(int i = 1; i <= n; i++) if (n%i == 0)  result += i; 
    return result;
}

// Factorial iterativo. Auxiliar de nC iterativo.
int factorialIterativo(int n) {
    int result = n;
    for(int i = n-1; i > 0; i--) result *= i;
    return result;
}


/* Como la definición recursiva de nC(n,k) no puede usarse (por ser recursiva)
 * uso la fórmula cerrada de nC(n,k) = n! / k!(n-k)!. El factorial lo puedo calcular
   de forma iterativa (aunque también existe su definición recursiva). */

int numeroCombinatorioIterativo(int n, int k) {
    if (n < k) return -1;
    if (n == k || k == 0) return 1;
    return factorialIterativo(n) / (factorialIterativo(k) * factorialIterativo(n-k));
}
