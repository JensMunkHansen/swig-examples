#pragma once

#include <cstdlib>
#include <cstdio>

struct MyStruct {
  float* pData;
};

int input(int k, const int memoryCells, int *cellFailure);

int output(char *rbuffer, size_t len);


class B {
public:
  B(const int memoryCells, int *cellFailure) {
    printf("%d\n", cellFailure[0]);
  }
};
