%module MyNumbers

%include <std_except.i>
%include <exception.i>
%include <pyabc.i>

// This is important to hook our C++ exception to a Python exception type.
%pythonabc(TooBigException, Exception)

%{
#include <iostream>
#include <typeinfo>
%}

%exception {
    try {
        $action
    }
    catch (const TooBigException& e) {
        // Copy construct and wrap a new instance of TooBigException here for Python
        SWIG_Python_Raise(SWIG_NewPointerObj(
            (new TooBigException(e)),
            SWIGTYPE_p_TooBigException,SWIG_POINTER_OWN),
        "TooBigException", SWIGTYPE_p_TooBigException);
        SWIG_fail;
    }
    catch(const std::exception& ex) {
      std::cerr << typeid(ex).name() << "\n";
    }
}

%inline %{
struct TooBigException: std::exception {
        void blahblah() {
                std::cerr << "blah\n";
        }

        virtual const char* what() const noexcept {return "Your messasge here";}
};


int fact(int n) {
    if (n > 10) throw TooBigException();
    else if (n <= 1) return 1;
    else return n*fact(n-1);
}
%}

%extend TooBigException {
        // Always nice to have:
        const char * __str__() const {
                return $self->what();
        }
}
