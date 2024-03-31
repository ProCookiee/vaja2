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

string decToBin(int x) {
    string bin = "";
    while(x > 0) {
        bin = to_string(x % 2) + bin;
        x /= 2;
    }
    return bin;
}

int main() {
    std::vector<int> v;
    preberi(v);
    ofstream izhod("izhod.txt");
    for(int i = 0; i < v.size(); i++) {
        izhod << decToBin(v[i]) << endl;
    }
    izhod.close();
    return 0;
}