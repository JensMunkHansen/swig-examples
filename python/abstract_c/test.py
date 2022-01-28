import foo

OK, f = foo.foo_new()
OK = foo.foo_set_value_b(f, 'Hello world!')
OK = foo.foo_free(f)

OK, f = foo.foo_new()
# Test safe to double delete
del f
