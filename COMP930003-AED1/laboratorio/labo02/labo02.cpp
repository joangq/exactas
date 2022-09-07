#include <iostream>

using namespace std;

/* TODO: Agregar los chequeos de input a cada ejercicio respectivamente */

void ejercicio1(void) {
    cout << "Ejercicio 1 - Repetición controlada por un contador." << '\n';
    int input;
    int contador = 0;
    int total = 0;

    while (contador < 10) {
        cout << "Ingresar un valor: ";
        cin >> input;
        
        if (input > 10 || input < 0) cout << "Entrada fuera de rango" << '\n';

        total += input;
        contador += 1;
    }

    cout << "Total: " << (int) total << '\n';
    cout << "Media: " << (float) total/contador << '\n';

    return;
}

void ejercicio2(void) {
    cout << "Ejercicio 2 - Repetición controlada por un centinela." << '\n';
    int input;
    int total = 0;

    while (input != -1) {
        cout << "Ingresar un valor o " << -1 << " para salir: ";
        cin >> input;
        total += input;
    }

    cout << "Total: " << total << '\n';

    return;
}

void ejercicio3(void) {
    cout << "Ejercicio 2 - Repetición controlada por un centinela." << '\n';
    int input;
    int total = 0;
    int contador = 0;

    while (input != -1 && contador < 10) {
        cout << "Ingresar un valor o " << -1 << " para salir: ";
        cin >> input;

        if (input > 10 || input < 0) {
            cout << "Entrada fuera de rango" << '\n';
        } else {
            total += input;
            contador += 1;
        }
    }

    if (input != -1) {
        cout << "Total: " << total << '\n';
        cout << "Media: " << total/contador << '\n';
    }

    return;
}

int main() {
    ejercicio3();

    return 0;
}
