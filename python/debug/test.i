%module test

/* Overwrite constcode typemap */
%typemap(constcode) int %{SWIG_Python_SetConstant(d, "$1",PyLong_FromLongLong(static_cast<long long>($1)));%}

%inline %{
  enum FooPresence : unsigned long long
  {
    Foo1 = 0x8000000000ULL,
        Foo2 = 0x4000000000ULL,
        Foo3 = 0x2000000000ULL,
        FooWithA1 = 0x1000000000ULL,
        FooWithA2 = 0x0800000000ULL,
        FooWithA3 = 0x0400000000ULL,
        FooWithA4 = 0x0200000000ULL,
        FooWithB1 = 0x0100000000ULL,
        FooWithB2 = 0x0080000000,
        FooWithB3 = 0x0040000000
        };
  %}
