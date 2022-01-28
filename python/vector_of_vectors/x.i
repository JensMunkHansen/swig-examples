%module x

%begin %{
#pragma warning(disable:4127 4701 4706 4996)
#include <vector>
#include <algorithm>
#include <sstream>
%}

%include <std_vector.i>
%include <std_string.i>
%template(vector_double) std::vector<double>;
%template(vector_vector_double) std::vector<std::vector<double> >;

// Input typemap converts from Python object to C++ object.
// Note error checking not shown for brevity.
// $input is the Python object, $1 is the C++ result.
//
%typemap(in) std::vector<std::vector<double> >* (std::vector<std::vector<double> > tmp) %{
    for(Py_ssize_t i = 0; i < PySequence_Size($input); ++i)
    {
        auto t = PySequence_GetItem($input,i);
        std::vector<double> vd;
        for(Py_ssize_t j = 0; j < PySequence_Size(t); ++j) {
            auto d = PySequence_GetItem(t,j);
            vd.push_back(PyFloat_AsDouble(d));
            Py_DECREF(d);
        }
        Py_DECREF(t);
        tmp.push_back(vd);
    }
    $1 = &tmp;
%}

// Output typemap converts from C++object to Python object.
// Note error checking not shown for brevity.
// $1 is the C++ object, $result is the Python result.
//
%typemap(out) std::vector<std::vector<double> >* %{
    $result = PyList_New($1->size()); // Create outer Python list of correct size
    for(size_t i = 0; i < $1->size(); ++i)
    {
        auto t = PyList_New((*$1)[i].size()); // Create inner Python list of correct size for this element.
        for(size_t j = 0; j < (*$1)[i].size(); ++j) {
            PyList_SET_ITEM(t,j,PyFloat_FromDouble((*$1)[i][j]));
        }
        PyList_SET_ITEM($result,i,t);
    }
%}

%inline %{
    struct velocity
    {
        std::vector<std::vector<double> > u;
        std::vector<std::vector<double> > v;
        std::vector<std::vector<double> > w;
      ~velocity() {
	printf("Deleted\n");
      }
    };

    // A test function with an in/out velocity parameter.
    void myfunc(velocity& vel)
    {
        for(auto& v : vel.u)
            std::transform(begin(v),end(v),begin(v),[](double d){return d*1.1;});
        for(auto& v : vel.v)
            std::transform(begin(v),end(v),begin(v),[](double d){return d*2.2;});
        for(auto& v : vel.w)
            std::transform(begin(v),end(v),begin(v),[](double d){return d*3.3;});
    }

    velocity* out()
    {
      velocity *v = new velocity();
      //      v->u = std::vector<double>({1.0,2.0,3.0});
      return v;
    }
%}
