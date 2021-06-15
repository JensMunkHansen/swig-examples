// File : dictmap.i
%module dictmap

%{
  #include "test.h"
%}

%include "typemaps.i"

%typemap(out) std::unordered_map<std::string, std::string> (PyObject* obj) %{
  obj = PyDict_New();
  for (const auto& n : $1) {
    PyObject* strA = PyUnicode_FromString(n.first.c_str());
    PyObject* strB = PyUnicode_FromString(n.second.c_str());
    PyDict_SetItem(obj, strA, strB);
    Py_XDECREF(strA);
    Py_XDECREF(strB);
  }
  $result = SWIG_Python_AppendOutput($result, obj);
%}

%include "test.h"

