%module mylib

%{
    #include "mylib.h"
%}

%include "std_vector.i"
%include "typemaps.i"

%define STD_TEMPLATE(TYPE...)
    %template() TYPE;
    %apply TYPE& OUTPUT {TYPE&}
    %typemap(argout) const TYPE& {
        // do nothing for const references
    }
    %typemap(out) (TYPE&) = (const TYPE&);
%enddef

STD_TEMPLATE (std::vector <int>);
STD_TEMPLATE (std::vector <double>);

// Don't require an input parameter in Python.
// Create a temporary vector to hold the output result.
%typemap(in,numinputs=0) std::vector<testing::Status>& (std::vector<testing::Status> tmp) %{
    $1 = &tmp;
%}

// Create a Python list object the same size as the vector
// and copy and convert the vector contents into it.
%typemap(argout) std::vector<testing::Status>& (PyObject* list) %{
    list = PyList_New($1->size());
    for(int x = 0; x < $1->size(); ++x)
        PyList_SET_ITEM(list, x, PyLong_FromLong($1->at(x)));
    $result = SWIG_Python_AppendOutput($result, list);
%}

%include "mylib.h"
