%module foo
%{
#include "foo.h"
%}

%include "typemaps.i"

%typemap(in, numinputs=0) Foo ** (Foo *temp) {
  $1 = &temp;
}

%typemap(argout) Foo ** {
  PyObject* temp = NULL;
  if (!PyList_Check($result)) {
    temp = $result;
    $result = PyList_New(1);
    PyList_SetItem($result, 0, temp);
  }
  temp = SWIG_NewPointerObj(*$1, SWIGTYPE_p__Foo, SWIG_POINTER_NEW);
  PyList_Append($result, temp);
  Py_DECREF(temp);
}

%delobject foo_free; // Protect for double deletion

struct _Foo {};
%extend _Foo {
  ~_Foo() {
    foo_free($self);
  }
};
%ignore _Foo;

%include "foo.h"
