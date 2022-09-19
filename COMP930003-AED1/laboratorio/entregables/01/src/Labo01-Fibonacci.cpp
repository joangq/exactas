#include <iostream>

using namespace std;

// Funcion de fibonacci que calcula n-esimo termino
int fibonacci(int n){
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
int main()
{
    int n;
    cin >> n;
    cout << fibonacci(n) << endl;
    return 0;
}