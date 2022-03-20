#include <array>
#include <vector>

class A
{
 public:
  A();
  float getData(size_t index);
  float getVectorData(size_t index);
 private:
  std::array<float,4> fArray;
  std::vector<float> vArray;
};
