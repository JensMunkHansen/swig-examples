#include "test.h"

#include <iostream>

int input(int k, const int memoryCells, int *cellFailure)
{
  for (int i=0 ; i < memoryCells ; i++) {
    std::cout << cellFailure[i] << std::endl;
  }
  return memoryCells;
}

int output(char *rbuffer, size_t len) {
  char* pChar = (char*) rbuffer;
  for (size_t i = 0 ; i < len ; i++) {
    rbuffer[i] = 'a';
  }
  rbuffer[len-1] = '\0';
  return 0;
}
