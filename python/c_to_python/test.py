import ctypes as ct

# Set up some types.
# Note that `c_char_p` can't be used as ctypes has special handling
# to convert it to a Python bytes object that inteferes with the
# callback working properly.
PCHAR = ct.POINTER(ct.c_char)
PPCHAR = ct.POINTER(PCHAR)
CALLBACK = ct.CFUNCTYPE(None, PPCHAR) # Note first parameter is return value

dll = ct.CDLL('./libtest.so')
# Declare function arguments and return values
dll.set_callback.argtypes = CALLBACK,
dll.set_callback.restype = None
dll.call_python_function.argtypes = PPCHAR,
dll.call_python_function.restype = None

# Set up callback function.  Note that the buffer can't go out-of-scope
# once the function returns or undefined behavior occurs, so the buffer
# is stored as an attribute of the function object so it will continue
# to exist.  A global variable would work, too.
@CALLBACK
def my_function(pp):
    my_function.buffer = ct.create_string_buffer(b'Hi From Python')
    pp[0] = my_function.buffer  # [0] dereferences char** so can assign char*

dll.set_callback(my_function)
p = PCHAR()
dll.call_python_function(ct.byref(p))
# Cast to a `c_char_p` to access `.value` and get a bytes object
# up to the terminating null.
print(ct.cast(p, ct.c_char_p).value)
