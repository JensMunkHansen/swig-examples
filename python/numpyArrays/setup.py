import numpy

from distutils.core import setup, Extension
#from setuptools import setup, Extension

setup(name="example",
      py_modules=["example"],
      ext_modules=[Extension("_example",
                             ["test.i","test.cpp"],
                             include_dirs = [numpy.get_include(), '.'],
                             swig_opts=['-c++', '-I.'],
      )]
)
