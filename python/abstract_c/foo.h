    typedef struct _Foo Foo;
    
    int foo_new(Foo **obj);
    int foo_free(Foo *obj);
    
    int foo_get_value_a(Foo *obj, int *result);
    int foo_set_value_a(Foo *obj, int value);
    
    int foo_get_value_b(Foo *obj, char **result);
    int foo_set_value_b(Foo *obj, char *value);
