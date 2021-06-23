    #include "example.h"
#include <cstdio>
    int A::Create(A** obj) {
      *obj = new A();
      return 0;
    }
int A::test() {
  return 5;
}

A::~A() {
  printf("destroyed\n");
}
