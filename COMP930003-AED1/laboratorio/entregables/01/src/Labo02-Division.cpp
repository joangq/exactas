#include <iostream>

void division(int dividendo, int divisor, int& cociente, int& resto){
	cociente = 0;
    resto = dividendo;

    while(resto >= divisor) {
        resto = resto - divisor;
        cociente++;
    }
}

using namespace std;
int main() {
    /* No hace falta modificar el main */
    //Leo la entrada
    int divisor, dividendo, cociente, resto;
    cin >> dividendo >> divisor;

    //Calculo la division
    division(dividendo,divisor,cociente,resto);

    //Salida
    cout << cociente << " " << resto;

    return 0;
}
