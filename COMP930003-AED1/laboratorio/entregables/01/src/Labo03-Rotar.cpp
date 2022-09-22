#include <iostream>
#include <vector>

using namespace std;

void rotar1(vector<int> &v) {
    v.insert(v.end(), v.front());
    v.erase(v.begin());
}

vector<int> rotar(vector<int> v, int k){
    for(int i = 0; i < k; i++) rotar1(v);
    return v;
}

int main() {
    /* No hace falta modificar el main */
    // Leo las entradas
    int n; //Longitud del vector a rotar
    cin >> n;
    int i = 0;
    int x;
    vector<int> v;// En v leo el vector
    while (i<n){
        cin >> x;
        v.push_back(x);
        i++;
    }

    int k; // La cantidad que tengo que rotar la guardo en k
    cin >> k;

    // Hago la rotacion
    vector<int> res = rotar(v,k);
    i = 0;

    // Imprimo el vector resultado
    while (i < res.size()){
        cout << res[i] << " ";
        i++;
    }

    return 0;
}

