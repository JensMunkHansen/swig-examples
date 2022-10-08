#include "test.h"
#include <stdio.h>

void myArrayCopy(int *sourceArray, int nitems) {
  printf("nitems: %d\n", nitems);
  if (nitems > 0) {
    printf("sourceArray[0] = %d\n", sourceArray[0]);
  }
}


int *getVector() {
  static int arr[3] = {11,12,13};
  return arr;
}

void myArrayCopy2( int* sourceArray2, int nitems0, int* targetArray2, int nitems1 )
{
  printf("nitems0: %d\n", nitems0);
  if (nitems0 > 0) {
    printf("sourceArray2[0] = %d\n", sourceArray2[0]);
  }
  targetArray2[4] = 42;
}
