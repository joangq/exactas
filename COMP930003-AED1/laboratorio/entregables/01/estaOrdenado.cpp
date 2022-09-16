bool estaOrdenado(vector<int> v) {
    bool ordenado = true;
    for(int i = 1; i < v.size()-1; i++) ordenado &= v[i-1] <= v[i];
    return ordenado;
}
