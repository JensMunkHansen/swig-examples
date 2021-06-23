    %module example
    %{
      #include "example.h"
    %}

    %typemap(in, numinputs=0) A **obj (A *temp) {
      $1 = &temp;
    }

    %typemap(argout) A ** {
      PyObject* temp = NULL;
      if (!PyList_Check($result)) {
        temp = $result;
        $result = PyList_New(1);
        PyList_SetItem($result, 0, temp);
      }

      // Create shadow object (do not use SWIG_POINTER_NEW)
      temp = SWIG_NewPointerObj(SWIG_as_voidptr(*$1),
                                $descriptor(A*),
                                SWIG_POINTER_OWN | 0);

      PyList_Append($result, temp);
      Py_DECREF(temp);
    }

    %delobject A;

    %include "example.h"
