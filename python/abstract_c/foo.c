    #include "foo.h"
    #include "stdlib.h"
    #include "string.h"
    
    struct FooImpl {
      char* c;
      int i;
    };
    
    int foo_new(Foo **obj)
    {
      struct FooImpl* f = (struct FooImpl*) malloc(sizeof(struct FooImpl));
      f->c = NULL;
      *obj = (Foo*) f;
      return 0;
    }
    int foo_free(Foo *obj)
    {
      struct FooImpl* impl = (struct FooImpl*) obj;
      if (impl) {
        if (impl->c) {
          free(impl->c);
          impl->c = NULL;
        }
      }
      return 0;
    }
    
    int foo_get_value_a(Foo *obj, int *result)
    {
      struct FooImpl* impl = (struct FooImpl*) obj;
      *result = impl->i;
      return 0;
    }
    int foo_set_value_a(Foo *obj, int value)
    {
      struct FooImpl* impl = (struct FooImpl*) obj;
      impl->i = value;
      return 0;
    }
    
    int foo_get_value_b(Foo *obj, char **result)
    {
      struct FooImpl* impl = (struct FooImpl*) obj;
      *result = impl->c;
      return 0;
    }
    int foo_set_value_b(Foo *obj, char *value)
    {
      struct FooImpl* impl = (struct FooImpl*) obj;
      int len = strlen(value);
      if (impl->c) {
        free(impl->c);
      }
      impl->c = (char*)malloc(len+1);
      strcpy(impl->c,value);
      return 0;
    }
