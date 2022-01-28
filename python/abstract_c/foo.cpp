#include "foo.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>

class FooImpl {
public:
  FooImpl() : c(NULL)
  {
    printf("FooImpl::FooImpl()\n");
  }
  ~FooImpl()
  {
    printf("FooImpl::~FooImpl()\n");
    if (c) {
      free(c);
    }
  }
  char* c;
  int i;
};

int foo_new(Foo **obj)
{
  *obj = (Foo*) new FooImpl();
  return 0;
}
int foo_free(Foo *obj)
{
  FooImpl* impl = (FooImpl*) obj;
  delete impl;
  return 0;
}

int foo_get_value_a(Foo *obj, int *result)
{
  FooImpl* impl = (FooImpl*) obj;
  *result = impl->i;
  return 0;
}
int foo_set_value_a(Foo *obj, int value)
{
  FooImpl* impl = (FooImpl*) obj;
  impl->i = value;
  return 0;
}

int foo_get_value_b(Foo *obj, char **result)
{
  FooImpl* impl = (FooImpl*) obj;
  *result = impl->c;
  return 0;
}
int foo_set_value_b(Foo *obj, char *value)
{
  FooImpl* impl = (FooImpl*) obj;
  int len = strlen(value);
  if (impl->c) {
    free(impl->c);
  }
  impl->c = (char*)malloc(len+1);
  strcpy(impl->c,value);
  return 0;
}
