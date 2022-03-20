#include "test.h"
// #include <exception>
#include <stdexcept>

A::A() {
  fArray = {{0.0f, 0.0f, 0.0f, 0.0f}};
  vArray = std::vector<float>(3);
}
float A::getData(size_t index)
{
  if (index < 4) {
    return fArray[index];
  }
  else {
    throw std::out_of_range("Shit");
  }
}

float A::getVectorData(size_t index)
{
  return this->vArray.at(index);
}
