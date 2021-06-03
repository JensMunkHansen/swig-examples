#include "test.h"

#include <cstdio>

void multipleInputs(const float* data, const int nData,
                    const float* pos, const int nPositions, const int nDim)
{
  if (nData > 0) {
    printf("%d'th element is: %f\n", (nData-1), data[nData-1]);
  }
  if ((nDim > 0) && (nPositions > 0)){
    printf("%d'th dimension of the %d'th element is: %f\n",
           (nDim-1), (nPositions-1), data[nData-1]);
  }
}
