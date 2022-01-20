#include "test.h"

extern "C" Foo *fun1() {
  static Foo f = { 1.234, "Hello" };
  return &f;
}
