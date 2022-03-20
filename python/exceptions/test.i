%module example
%{
#include "test.h"
%}

%include "exception.i"
%include "std_vector.i"

%exception getData {
   try {
      $action
   }
   catch (std::out_of_range &e) {
     PyErr_SetString(PyExc_IndexError, const_cast<char*>(e.what()));
     return NULL;
   }
}

%template(VectFloat) std::vector<float>;

// TODO: Figure out how to catch std::vector::at, this handles everything
%exception  /*std::vector */  {
    try {
        $action
    }
    catch (std::out_of_range& e) {
        SWIG_exception(SWIG_IndexError,const_cast<char*>(e.what()));
    }
}


/*
PyExc_ArithmeticError
PyExc_AssertionError
PyExc_AttributeError
PyExc_EnvironmentError
PyExc_EOFError
PyExc_Exception
PyExc_FloatingPointError
PyExc_ImportError
PyExc_IndexError
PyExc_IOError
PyExc_KeyError
PyExc_KeyboardInterrupt
PyExc_LookupError
PyExc_MemoryError
PyExc_NameError
PyExc_NotImplementedError
PyExc_OSError
PyExc_OverflowError
PyExc_RuntimeError
PyExc_StandardError
PyExc_SyntaxError
PyExc_SystemError
PyExc_TypeError
PyExc_UnicodeError
PyExc_ValueError
PyExc_ZeroDivisionError
*/

%include "test.h"
