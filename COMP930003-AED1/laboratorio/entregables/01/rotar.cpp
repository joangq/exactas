vector<int> rotar(vector<int> v, int k){
    for(int i = 0; i < k; i++) {
        v.push_back(v[0]);
        v.erase(v.begin());
    }
    return v;
}
