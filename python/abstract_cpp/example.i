%module example
%{
  #define SWIG_FILE_WITH_INIT
  #include "bar.hpp"
  #include "bar_impl.hpp"
%}

%include "std_vector.i"
%include <std_shared_ptr.i>

%include "typemaps.i"

%typemap(in, numinputs=0) (bar::BarBase **ARGOUT_OBJECT) (bar::BarBase *temp) {
  $1 = &temp;
}

%typemap(argout) (bar::BarBase **ARGOUT_OBJECT) {
  PyObject* temp = NULL;
  if (!PyList_Check($result)) {
    temp = $result;
    $result = PyList_New(1);
    PyList_SetItem($result, 0, temp);
  }
  // Create shadow object (do not use SWIG_POINTER_NEW)
  temp = SWIG_NewPointerObj(SWIG_as_voidptr(*$1),
			    $descriptor(bar::BarBase*),
			    SWIG_POINTER_OWN | 0);

  PyList_Append($result, temp);
  Py_DECREF(temp);
}

%apply (bar::BarBase** ARGOUT_OBJECT) \
{(bar::BarBase **obj)}



// TEST
// %typemap(in, numinputs=0) (bar::BarBase *&) (bar::BarBase* temp) {
//   $1 = &temp;
// }
// 
// %typemap(argout) (bar::BarBase *&obj) {
// 
//   bar::BarBase* newObj;
//   *(bar::BarBase**)&newObj = *$1;
//  
//   PyObject* temp = NULL;
//   if (!PyList_Check($result)) {
//     temp = $result;
//     $result = PyList_New(1);
//     PyList_SetItem($result, 0, temp);
//   }
//   // Create shadow object (do not use SWIG_POINTER_NEW)
//   temp = SWIG_NewPointerObj(SWIG_as_voidptr(newObj),
// 			    $descriptor(bar::BarBase*),
// 			    SWIG_POINTER_OWN | 0);
// 
//   PyList_Append($result, temp);
//   Py_DECREF(temp);
// }

/* %class_output_typemaps() macro
 *
 * It must be executed for each class CLASS_TYPE, which needs typemaps for output
 */
%define %class_output_typemaps(CLASS_TYPE)

%typemap(in, numinputs=0) (CLASS_TYPE *&ARGOUT_OBJECT) (CLASS_TYPE* temp) {
  $1 = &temp;
}

%typemap(argout) (CLASS_TYPE *&ARGOUT_OBJECT) {

  CLASS_TYPE* newObj;
  *(CLASS_TYPE**)&newObj = *$1;
 
  PyObject* temp = NULL;
  if (!PyList_Check($result)) {
    temp = $result;
    $result = PyList_New(1);
    PyList_SetItem($result, 0, temp);
  }
  // Create shadow object (do not use SWIG_POINTER_NEW)
  temp = SWIG_NewPointerObj(SWIG_as_voidptr(newObj),
			    $descriptor(CLASS_TYPE*),
			    SWIG_POINTER_OWN | 0);

  PyList_Append($result, temp);
  Py_DECREF(temp);
}

%enddef    /* %class_output_typemaps() */

%class_output_typemaps(bar::BarBase)

%apply (bar::BarBase*& ARGOUT_OBJECT) \
{(bar::BarBase *&obj)}


//%apply exportedClassType& OUTPUT { exportedClassType& result };

%typemap(in, numinputs=0) (int *count, bar::BarBase ***objs) (int dim, bar::BarBase **temp) {
  $1 = &dim;
  $2 = &temp;
}

%typemap(argout) (int *count, bar::BarBase ***) {
  PyObject* temp = NULL;
  if (!PyList_Check($result)) {
    temp = $result;
    $result = PyList_New(1);
    PyList_SetItem($result, 0, temp);
  }

  for (int i = 0 ; i < (*$1) ; i++) {
    PyObject* s = SWIG_NewPointerObj(SWIG_as_voidptr(*(*$2+i)),
				     $descriptor(bar::BarBase*),
				     SWIG_POINTER_OWN | 0);
    PyList_Append($result,s);
    Py_DECREF(s);
  }
  free(*$2);
}

%typemap(in, numinputs=0) (int *cnt, bar::BarBase ***objs) (int dim, bar::BarBase **temp) {
  $1 = &dim;
  $2 = &temp;
}

%typemap(argout) (int *cnt, bar::BarBase ***) {
  PyObject* temp = NULL;
  if (!PyList_Check($result)) {
    temp = $result;
    $result = PyList_New(1);
    PyList_SetItem($result, 0, temp);
  }
  printf("Create using []\n");
  for (int i = 0 ; i < (*$1) ; i++) {
    PyObject* s = SWIG_NewPointerObj(SWIG_as_voidptr(*(*$2+i)),
				     $descriptor(bar::BarBase*),
				     SWIG_POINTER_OWN | 0);
    PyList_Append($result,s);
    Py_DECREF(s);
  }
  delete[] *$2;
}

%typemap(in, numinputs=0) (char** result) (char *temp) {
  $1 = &temp;
}

%typemap(argout) (char** result) {
  $result = PyString_FromString(*$1);
  printf("Freeing string\n");
  free(*$1);
}


%typemap(in, numinputs=0) bar::ResourceList **obj (bar::ResourceList *temp) {
  $1 = &temp;
}

%typemap(argout) bar::ResourceList ** {
  PyObject* temp = NULL;
  if (!PyList_Check($result)) {
    temp = $result;
    $result = PyList_New(1);
    PyList_SetItem($result, 0, temp);
  }
  // Create shadow object (do not use SWIG_POINTER_NEW)
  temp = SWIG_NewPointerObj(SWIG_as_voidptr(*$1),
			    $descriptor(bar::ResourceList*),
			    SWIG_POINTER_OWN | 0);

  PyList_Append($result, temp);
  Py_DECREF(temp);
}
%delobject bar::ResourceListDestroy;


%extend bar::ResourceList {
  const bar::Element& __getitem__(int index) const {
    return (*($self))[index];
  }
  int __len__() const {
    return (int) ($self)->count;
  }
}

%typemap(in, numinputs=0) Module::SampleBase *&obj (Module::SampleBase *temp) {
  $1 = &temp;
}

%typemap(argout) Module::SampleBase *& {
  PyObject* temp = NULL;
  if (!PyList_Check($result)) {
    temp = $result;
    $result = PyList_New(1);
    PyList_SetItem($result, 0, temp);
  }
  // Create shadow object (do not use SWIG_POINTER_NEW)
  temp = SWIG_NewPointerObj(SWIG_as_voidptr(*$1),
			    $descriptor(Module::SampleBase*),
			    SWIG_POINTER_OWN | 0);

  PyList_Append($result, temp);
  Py_DECREF(temp);
}



%include <cpointer.i>
%pointer_cast(bar::BarBase*,  bar::BarImpl*, cast_base_to_impl);
%pointer_cast(bar::BarImpl*,  bar::BarBase*, cast_impl_to_base);

/*
%shared_ptr(bar::BarBase)
%shared_ptr(bar::BarImpl)
%template(MyVector) std::vector<std::shared_ptr<bar::BarBase> >;
*/

%include "bar.hpp"
%include "bar_impl.hpp"

