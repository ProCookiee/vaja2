#include <cassert>
#include <sstream>
#include <vector>
#include "vaja2.h"
#include <iostream>

using namespace std;

void test_decToBin() {
    assert(decToBin(10) == "1010");
    assert(decToBin(1) == "1"); 
    assert(decToBin(16) == "10000");
    assert(decToBin(100) == "1100100");
}

void test_binToDec() {
    assert(binToDec("1010") == 10);
    assert(binToDec("00000001") == 1);
    assert(binToDec("10000") == 16);
    assert(binToDec("1100100") == 100);
}

void test_sorting() {
    vector<int> numbers = {10, 1, 3, 6, 100, 52 };
    vector<string> bin = binarna(numbers);
    vector<string> sorted = radixSort(bin);

    assert(binToDec(sorted[0]) == 1);
    assert(binToDec(sorted[1]) == 3);
    assert(binToDec(sorted[2]) == 6);
    assert(binToDec(sorted[3]) == 10);
    assert(binToDec(sorted[4]) == 52);
    assert(binToDec(sorted[5]) == 100);
}

int main() {
    test_decToBin();
    test_binToDec();
    test_sorting();
    
    cout << "Vsi testi so uspešno prestani!" << endl;
    return 0;
}
