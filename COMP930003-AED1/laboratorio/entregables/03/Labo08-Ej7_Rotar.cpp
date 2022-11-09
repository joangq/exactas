#include <iostream>
#include <string>

using namespace std;

void rotar1(string &s) {
    s.insert(s.begin(), s.back());
    s.erase(prev(s.end()));
}

string rotar(string s, int j) {
    for(int i = 0; i < j % s.size(); i++) rotar1(s);
    return s;
}

int main()
{
    /* No hace falta modificar el main */
    // Leo la entrada
    string s;
    int j;
    cin >> s >> j;
    
    string res = rotar(s, j);
    cout << res;
    return 0;
}
