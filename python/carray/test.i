%module example
%{
     #include "test.h"
%}

%typemap(in) (const int memoryCells, int *cellFailure) {
  int i;
  if (!PyList_Check($input)) {
    PyErr_SetString(PyExc_ValueError, "Expecting a list");
    return NULL;
  }
  $1 = PyList_Size($input);
  printf("Allocating\n");
  $2 = (int *) malloc(($1)*sizeof(int));
  for (i = 0; i < $1; i++) {
    PyObject *s = PyList_GetItem($input,i);
    if (!PyInt_Check(s)) {
      printf("Freeing\n");
      free($2);
      PyErr_SetString(PyExc_ValueError, "List items must be integers");
      return NULL;
    }
    $2[i] = PyInt_AsLong(s);
  }
 }

%typemap(freearg) (const int memoryCells, int *cellFailure) {
  if ($2) {
    printf("Freeing\n");
    free($2);
  }
}



// typemap for an incoming buffer
%typemap(in) (char *rbuffer, size_t len) {
   if (!PyInt_Check($input)) {
       PyErr_SetString(PyExc_ValueError, "Expecting an integer");
       return NULL;
   }
   $2 = PyInt_AsLong($input);
   if ($2 < 0) {
       PyErr_SetString(PyExc_ValueError, "Positive integer expected");
       return NULL;
   }
   $1 = (char *) malloc($2);
}

// Return the buffer.  Discarding any previous return result
%typemap(argout) (char *rbuffer, size_t len) {
   Py_XDECREF($result);   /* Blow away any previous result */
   if (result < 0) {      /* Check for I/O error */
     printf("Freeing\n");
     free($1);
     PyErr_SetFromErrno(PyExc_IOError);
     return NULL;
   }
   // $result = PyString_FromStringAndSize($1,result); // Python2
   $result = PyBytes_FromStringAndSize($1, result);
   // PyBytes_FromStringAndSize
   free($1);
}

%include "carrays.i"
%array_functions(float, floatArray)

%include "test.h"
