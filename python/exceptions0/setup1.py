#!/usr/bin/env python
from distutils.core import setup, Extension

#os.environ['CC'] = 'g++';
setup(name="MyNumbers",
      py_modules=['MyNumbers'],
      ext_modules=[Extension("_MyNumbers",
                             ["numbers1.i"],
                             swig_opts=['-c++'],
                             extra_compile_args=['-I. --std=c++11']
                            )]
)
