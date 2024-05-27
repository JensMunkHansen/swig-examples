#include "challenge.h"

int SomeClass::Function(int argument) { return argument; }

double SomeClass::ArraySum(double* data, size_t nData) {
  double retval = 0.0;
  for (size_t i = 0 ; i < nData; i++) {
    retval += data[i];
  }
  return retval;
}
