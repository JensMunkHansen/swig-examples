#pragma once

#include <cstddef>

class SomeClass {
 public:
 SomeClass() : scalar(0.0f), integer(0) {}
  int Function(int argument);
  double ArraySum(double* data, size_t nData);
 private:
  float scalar;
  int integer;
};
