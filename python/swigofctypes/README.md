Swig-wrapped instance from ctypes pointer

You can do this, but it's rather a lot of work and it would be much
simpler to fix the underlying problem of making either the ctypes or
the SWIG interface complete and usable than force
interchangeability. (It's also worth noting that it's easier to create
a ctypes object from a SWIG one than it is to do what you're trying to
do, which is to create a SWIG object from a ctypes one).

To illustrate this I've created the following header file that we'll
wrap with SWIG:

struct Foo {
  double d;
  char msg[20];
};
Then I wrapped it with the following interface:

%module test

%{
#include "test.h"
%}

// Prove I'm not cheating here - we can't even instantiate this class
%nodefaultctor;

%include "test.h"
I also added a test function for us to call from ctypes, that isn't SWIG wrapped:

#include "test.h"

// This function returns a Foo, but is only accessible to ctypes
extern "C" Foo *fun1() {
    static Foo f = { 1.234, "Hello" };
    return &f;
}

Your guess about this this attribute of SWIG wrapped classes is a good
starting point, but it's not as simple as just changing that - the
type of the object you slot in has to match what SWIG expects. It's
more than just a pointer represented as an int:

repr(test.Foo().this) # You'll need to drop the nodefaultctor directive to see this
"<Swig Object of type 'Foo *' at 0x7f621197d1e0>"

If we inspect the source code that SWIG generates we can see that
there is a function which takes a pointer, some type information and
creates these objects for us:

SWIGRUNTIME PyObject *
SwigPyObject_New(void *ptr, swig_type_info *ty, int own);

Let's ignore the fact that SWIGRUNTIME is defined as static by default
for now, to get us started experimenting with this runtime we can
redefine it to extern. Later we'll look at workarounds for when we
can't do that.

So our goal is to take the output of the "ctypes only" function and
pass it, via more ctypes calls into SwigPyObject_New to create
something we can swap around for with the this attribute of our SWIG
module.

In order to call that we'd normally call SWIG_TypeQuery to lookup the
correct swig_type_info to use. However this is actually a macro, which
expands to pass in some static variables that are always static. So
instead we'll be using this function:

SWIGRUNTIME swig_type_info *
SWIG_Python_TypeQuery(const char *type)
(with the same SWIGRUNTIME proviso).

At this point we've got enough that we could swap the this attribute
of a surrogate object and be done if we were able to construct
donors. (Although that would leak). There are two ways we can make
this nicer:

Monkey patch __init__ inside test.Foo to work. This is best if you
really have %nodefaultctor inside the SWIG interface you don't want to
recompile:

def patched_init(self, ptr):
    self.this = ptr
test.Foo.__init__ = patched_init

Create a new class that only has an __init__ which sets the this
attribute before modifying the __class__ attribute and use that
instead:

class FooCtypesSwigInterop(object):
    def __init__(self, ptr):
        self.this = ptr
        self.__class__ = test.Foo

this option makes most sense when you don't want to break test.Foo's existing __init__ implementation.

With that said we can now achieve our initial goal with something like this:

import ctypes
import test

# This *must* happen after the import of the real SWIG module
# 0x4 is RTLD_NOLOAD which ensures that we get the same handle as the Python 
# import did, even if it was loaded with RTLD_LOCAL as Python is prone to.
swig_module = ctypes.PyDLL('./_test.so',ctypes.RTLD_LOCAL|0x4)
# Note that we used PyDLL instead of CDLL because we need to retain the GIL

# Setup SWIG_Python_TypeQuery to have the right argument/return types
# (Using void* as a substitute for swig_type_info*)
SWIG_Python_TypeQuery = swig_module.SWIG_Python_TypeQuery
SWIG_Python_TypeQuery.argtypes = [ctypes.c_char_p]
SWIG_Python_TypeQuery.restype = ctypes.c_void_p

# Likewise SwigPyObject_New, using ctypes.py_object though for return
SwigPyObject_New = swig_module.SwigPyObject_New
SwigPyObject_New.argtypes = [ctypes.c_void_p, ctypes.c_void_p, ctypes.c_int]
SwigPyObject_New.restype = ctypes.py_object

# Actually do the type query for the type our ctypes function returns:
SWIGTYPE_p_Foo = SWIG_Python_TypeQuery('Foo*')
print(hex(SWIGTYPE_p_Foo))

# Now the ctypes function itself that returns the type we want SWIG managed
fun1 = swig_module.fun1
fun1.argtypes = []
fun1.restype = ctypes.c_void_p

# Make the actual ctypes call we care about here
result = fun1()
print(hex(result))

# And then create a SwigPyObject for it from the void* return type
# Note that 0 means not owned by SWIG
sresult = SwigPyObject_New(result, SWIGTYPE_p_Foo, 0)
print(repr(sresult))

# This is how we jimmy it back into the this attribute of a SWIG type
class FooCtypesSwigInterop(object):
    def __init__(self, ptr):
        self.this = ptr
        self.__class__ = test.Foo

c = FooCtypesSwigInterop(sresult)

# Finally a usable SWIG object from the ctypes call 
print(c.msg)

This all compiles and works with:

swig3.0 -python -c++ -Wall test.i
g++ -shared -o _test.so test_wrap.cxx fun1.cc -Wall -Wextra -fPIC -I/usr/include/python2.7/ -std=c++11 -DSWIGRUNTIME=extern
LD_LIBRARY_PATH=.  python run.py 
And gives us:

0x7fb6eccf29e0
0x7fb6eccf2640
<Swig Object of type 'Foo *' at 0x7fb6ee436720>
Hello

To work around the problem of having SWIGRUNTIME defined as static
you'll need to do one more step. Either use debug symbols or reverse
engineer the SWIG binary module you've got but can't modify to find
the addresses of the two functions we need that aren't exported
relative to an exported symbol. You can then use those to construct
ctypes function pointers instead of looking them up by name. Of course
it would be easier to buy/find/re-write the SWIG module, or add the
missing features to the ctypes interface probably.

(Finally it's worth noting that although it doesn't seem to apply here
if SWIG runs with -builtin some substantial changes will need to be
made for this answer to work).

