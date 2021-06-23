#!/usr/bin/env python
from distutils.core import setup, Extension

#os.environ['CC'] = 'g++';
setup(name="dictmap",
      py_modules=['dictmap'],
      ext_modules=[Extension("_dictmap",
                     ["dictmap.i"],
                     swig_opts=['-c++'],
                             extra_compile_args=['--std=c++11']
                             )]
)
