#include <boost/python.hpp>
#include <iostream>
#include "myif.h"

using namespace boost::python;

// This is basically Eudoxos's answer:
struct MyIfWrapper: myif, wrapper<myif>{
  float myfunc(float a) const {
    if(this->get_override("myfunc")) 
      return this->get_override("myfunc")(a);
    else 
      return myif::myfunc(a);
  }
};

BOOST_PYTHON_MODULE(myif){
  class_<MyIfWrapper,boost::noncopyable>("myif")
    .def("myfunc",&myif::myfunc)
  ;
}
// End answer by Eudoxos

int main( int argc, char ** argv ) {
  try {
    // Tell python that "myif" is a built-in module
    PyImport_AppendInittab("myif", PyInit_myif); // was initmyif
    // Set up embedded Python interpreter:
    Py_Initialize();

    object main_module = import("__main__");
    object main_namespace = main_module.attr("__dict__");

    PySys_SetPath(L".");
    main_namespace["mycl"] = import("mycl");

    // Create the Python object with an eval()
    object obj = eval("mycl.MyCl()", main_namespace);

    // Find the base C++ type for the Python object (from Eudoxos)
#if 1
    const myif& b = extract<myif>(obj)();
    std::cout << b.myfunc(5) << std::endl;
#else
    {
      extract<myif> ex(obj);
      if(ex.check()){ // types are compatible
	const myif& b=ex(); // get the wrapped object
	std::cout << b.myfunc(5) << std::endl;
	// ...
      } else {
	// error
      }
    }
#endif

  } catch( error_already_set ) {
    PyErr_Print();
  }
}
