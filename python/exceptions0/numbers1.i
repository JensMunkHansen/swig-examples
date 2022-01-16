%module MyNumbers

%include <std_except.i>
%include <exception.i>
%include <pyabc.i>

// It seems this isn't actually needed with the exception specifiers either
//%pythonabc(TooBigException, Exception)

%{
#include <iostream>
#include <typeinfo>
%}

%inline %{
  struct TooBigException: std::exception {
    void blahblah() {
      std::cerr << "blah\n";
    }
    virtual const char* what() const noexcept {return "Your messasge here";}
  };

  // This is the main change here - an exception specifier:
  int fact(int n) throw(TooBigException) {
    if (n > 10) throw TooBigException();
    else if (n <= 1) return 1;
    else return n*fact(n-1);
  }
%}

%extend TooBigException {
  const char * __str__() const {
    return $self->what();
  }
 }
