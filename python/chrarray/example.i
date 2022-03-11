%typemap(in, numinputs=1) (const char *data, unsigned long int size) {
  Py_buffer view;
  if (PyObject_CheckBuffer($input) != 1) {
    PyErr_SetString(
                    PyExc_TypeError,
                    "in method '$symname', argument $argnum does not support the buffer interface");
    SWIG_fail;
  }
  if (PyObject_GetBuffer($input, &view, PyBUF_SIMPLE) != 0) {
    PyErr_SetString(
                    PyExc_TypeError,
                    "in method '$symname', argument $argnum does not export a simple buffer");
    SWIG_fail;
  }
  $1 = view.buf;
  $2 = view.len;
  PyBuffer_Release(&view);
 }
%typemap(doc) const char *data, unsigned long int size "$1_name: readable buffer (e.g. bytes)"
