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
SWIGTYPE_p_Foo = SWIG_Python_TypeQuery("Foo*")
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
