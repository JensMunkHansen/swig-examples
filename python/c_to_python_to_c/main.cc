#include <iostream>
#include "myif.h"
#include <Python.h>

int main() {
  Py_Initialize();
  if (!Py_IsInitialized()) {
    std::cout << "Not initialized" << std::endl;
    return -1;
  }

  const double input = 5.0;

  PyObject *main = nullptr;

  main = PyImport_AddModule("__main__");

  if (!main) {
    std::cout << "No main" << std::endl;
    return -1;
  }
  wchar_t* path = nullptr;

  path = Py_GetPath();
  printf("Python search path is:\n%ls\n", path);

  PyObject* syspath = PySys_GetObject((char*)"path");
  if (syspath == 0)
    printf("Python failed to import sys\n");

  char eximpath[] = "/home/jmh/github/swig-examples/python/c_to_python_to_c";
  //char eximpath[] = "./";

  printf("Adding %s\n", eximpath);
  PyObject* pName = PyUnicode_FromString(eximpath);
  if (PyList_Insert(syspath, 0, pName))
    printf("Error inserting extra path into sys.path list\n");
  if (PySys_SetObject((char*) "path", syspath))
    printf("Error setting sys.path object\n");

  pName = PyUnicode_FromString("mycl");

  //PySys_SetPath((char*)".");
  PyObject *pModule = nullptr;

  pModule = PyImport_Import(pName);

  Py_DECREF(pName);
  if (pModule == NULL)
    printf("Unable to import module\n");
  else
    printf("Loaded module\n");

  PyModule_AddObject(main, "mycl", pModule);

  PyObject *instance = nullptr;

#if 1
  PyObject *dict = PyModule_GetDict(main);
  char constructObject[] = "mycl.MyCl()";
  instance = PyRun_String(constructObject, Py_eval_input, dict, dict);
#else
  PyObject *cls = PyObject_GetAttrString(pModule, "MyCl");
  instance = PyObject_CallFunctionObjArgs(cls, NULL);
#endif

  if (!instance) {
    std::cout << "No instance created" << std::endl;
    return -1;
  }

  PyObject *result =
      PyObject_CallMethod(instance,
                          (char*) "myfunc",
                          (char *) "(O)",
                          PyFloat_FromDouble(input));

  PyObject *error = PyErr_Occurred();

  if (error) {
    std::cerr << "Error occured in PyRun_String" << std::endl;
    PyErr_Print();
  }

  double ret = PyFloat_AsDouble(result);
  std::cout << ret << std::endl;

  Py_DECREF(syspath);
  Py_Finalize();
  return 0;
}
