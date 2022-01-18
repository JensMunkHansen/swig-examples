You want SWIG to perform a conversion between Java and C++ types, namely

 1. Java byte[] to unsigned char * and
 
 2. String to char *.

The general tools for such conversions are SWIG
typemaps. Conveniently, many are already provided by SWIG and simply
need to be applied. Have a look at the Java typemap documentation.

The latter conversion (String to char *) is done automatically by SWIG
(using predefined typemaps that match char * arguments).

Using predefined typemaps
-------------------------

A standard conversion very similar to what you want (byte[] to char *)
is handled by the "char * BYTE" typemaps defined in the file
various.i. To use it, all you need to do is add

%include various.i
%apply char *BYTE { char *buffer_variable_name };

at the top of the swig interface file, where buffer_variable_name is
the name of the variable in the function argument (typemaps can be
matched by name). For details, see the general typemap documentation
and the Java typemap documentation.

However, this is not exactly what you want, since your function takes
an unsigned char *. If you can use java.nio.Buffer instead of byte[]
on the Java side (which needs to be allocated via allocateDirect),
there is a different set of typemaps predefined in various.i that can
be used via

%apply unsigned char *NIOBUFFER { unsigned char *buffer_variable_name };

Writing your "own" typemaps
---------------------------

In your case you want essentially the same as the provided "char *
BYTE" typemaps, but for functions taking unsigned char *. So you can
just copy these from various.i to a new file ubyte.i and tweak them
slightly:

fix typemap for unsigned char
