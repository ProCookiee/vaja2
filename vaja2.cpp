#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

void preberi(std::vector<int> &v) {
    ifstream vhod("vhod.txt");
    int x;
    while(vhod >> x) {
        v.push_back(x);
    }
    vhod.close();
}

int main() {
    std::vector<int> v;
    preberi(v);
    ofstream izhod("izhod.txt");
    for(int i = 0; i < v.size(); i++) {
        izhod << v[i] << endl;
    }
    izhod.close();
    return 0;
}