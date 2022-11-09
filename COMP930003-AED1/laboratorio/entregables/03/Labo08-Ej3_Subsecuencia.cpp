#include <iostream>
#include <string>

using namespace std;

bool subsecuencia(string s, string t) {
    int aparicion = 0;
    
    for (char &c : t) 
        if (s[aparicion] == c) aparicion++;
        
    return aparicion == s.size();
}

int main()
{
    /* No hace falta modificar el main */
    // Leo la entrada
    string s, t;
    cin >> s >> t;
    
    bool res = subsecuencia(s, t);
    cout << (res ? "true" : "false");
    return 0;
}

