#include <iostream>
#include "myif.h"
#include <Python.h>

#include "runtime.h" // runtime.h was generated by SWIG for us with the second call we made

myif *python2interface(PyObject *obj) {
  void *argp1 = 0;
  swig_type_info * pTypeInfo = SWIG_TypeQuery("myif *");

  const int res = SWIG_ConvertPtr(obj, &argp1, pTypeInfo, 0);
  if (!SWIG_IsOK(res)) {
    abort();
  }
  return reinterpret_cast<myif*>(argp1);
}

int main() {
  Py_Initialize();

  const double input = 5.5;

  PyObject* syspath = PySys_GetObject((char*)"path");

  PyObject* pName = PyString_FromString((char*) ".");
  PyList_Insert(syspath, 0, pName);
  PySys_SetObject((char*) "path", syspath);


  PyObject *module = nullptr;
  PyObject *cls = nullptr;
  PyObject *instance = nullptr;
  myif *inst = nullptr;

  // Load Python module
  module = PyImport_ImportModule("mycl");

  // Find attribute
  cls = PyObject_GetAttrString(module, "MyCl");

  // Construct object
  instance = PyObject_CallFunctionObjArgs(cls, NULL);

  // Cast to SWIG-wrapper
  inst = python2interface(instance);

  // Call function
  std::cout << inst->myfunc(input) << std::endl;

  Py_XDECREF(instance);
  Py_XDECREF(cls);

  Py_XDECREF(syspath);
  Py_Finalize();
  return 0;
}



/*
For those who, like me, want C++ to have ownership of the object and
be able to delete objects the C++ way, here is what you have to do: 1)
create the instance by running mycl.MyCl().__disown__(), 2) cast the
instance to your interface by calling python2interface, 3) run
Py_DECREF on the PyObject instance, 4) when you're done with your
object, destroy it using delete, this should also destroy the Python
object (assuming there are no more references to it in Python, which
there shouldn't be if you created it using Flexo's method)
*/
