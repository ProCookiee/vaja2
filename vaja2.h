#include <string>
#include <vector>

void preberi(std::vector<int> &v);
std::string decToBin(int x);
int binToDec(std::string bin);
std::vector<std::string> binarna(std::vector<int> numbers);
int returnDigit(std::string bin, int digit);
void bubbleSort(std::vector<std::string> &sorted, int k);
std::vector<std::string> radixSort(std::vector<std::string> bin);