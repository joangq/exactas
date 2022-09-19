#include <iostream>
#include <vector>

using namespace std;

bool estaOrdenado(vector<int> v){
    bool creciente = true;
    bool decreciente = true;

    for(int i = 0; i < v.size()-1; i++) {
        creciente &= v[i] <= v [i + 1];
        decreciente &= v[i] >= v [i + 1];
    }

    return creciente|decreciente;
}

int main() {
    /* No hace falta modificar el main */
    // Leo las entradas
    int n;
    cin >> n;
    int i = 0;
    int x;
    vector<int> v;// En v leo el vector
    while (i<n){
        cin >> x;
        v.push_back(x);
        i++;
    }

    // Evaluo si el vector v esta ordenado
    bool res = estaOrdenado(v);

    // Imprimo la salida
    cout << (res?"True":"False");

    return 0;
}
