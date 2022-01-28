#!/usr/bin/env python
from distutils.core import setup, Extension
import numpy
import os

if 0:
  os.environ['CC'] = 'g++';
  setup(name='foo',
        version='1.0',
        ext_modules = [Extension('_foo',
                                 ['foo.i','foo.cpp'],
                                 include_dirs = [numpy.get_include(),'.'],
                                 swig_opts=['-c++'])])
else:
  os.environ['CC'] = 'gcc';
  setup(name='foo',
        version='1.0',
        ext_modules =[Extension('_foo',
                                ['foo.i','foo.c'], include_dirs = [numpy.get_include(),'.'])])
  
