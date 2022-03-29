import numpy

from setuptools import setup, Extension

setup(name="mylib",
      py_modules=["mylib"],
      ext_modules=[Extension("_mylib",
                             ["mylib.i"],
                             include_dirs = [numpy.get_include(), '.'],
                             swig_opts=['-c++', '-I.'],
      )]
)
