#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

//Prebere števila iz datoteke vhod.txt in jih shrani v vektor
void preberi(std::vector<int> &v) {
    ifstream vhod("vhod.txt");
    int x;
    while(vhod >> x) {
        v.push_back(x);
    }
    vhod.close();
}

//Pretvori decimalno število v binarno število
string decToBin(int x) {
    string bin = "";
    while(x > 0) {
        bin = to_string(x % 2) + bin;
        x /= 2;
    }
    return bin;
}

//Pretvori binarno število nazaj v decimalno število
int binToDec(string bin) {
    int dec = 0;
    for(int i = 0; i < bin.length(); i++) {
        dec = dec * 2 + (bin[i] - '0');
    }
    return dec;
}

//Naredi vektor binarnih števil in doda 0 na začetek da so vsa števila dolga 8 mest ker je 8bit
vector<string> binarna(vector<int> numbers) {
    vector<string> bin;
    for(int i = 0; i < numbers.size(); i++) {
        string b = decToBin(numbers[i]);
        while(b.length() < 8) {
            b = "0" + b;
        }
        bin.push_back(b);
    }
    return bin;
}

//Vrne digit na nekem mestu
int returnDigit(string bin, int digit){
    cout << bin[bin.size()-digit-1] <<endl;
    return bin[bin.size()-digit-1] - '0';
}

//Stable sort - uporabljen bubble sort
void bubbleSort(vector<int> &D, vector<string> &sorted){
    for(int i = 0; i < D.size(); i++){
        for(int j = 0; j < D.size()-1; j++){
            if(D[j] > D[j+1]){
                swap(D[j],D[j+1]);
                swap(sorted[j],sorted[j+1]);
            }
        }
    }

}

int main() {
    vector<int> numbers;
    preberi(numbers);
    vector<string> bin = binarna(numbers);
    ofstream izhod("izhod.txt");
    for(int i = 0; i < bin.size(); i++) {
        izhod << bin[i] << endl;
    }
    izhod.close();
    return 0;
}