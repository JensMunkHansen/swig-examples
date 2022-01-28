#!/usr/bin/env python
from distutils.core import setup, Extension
import numpy
import os

os.environ['CC'] = 'g++';
setup(name='example',
      version='1.0',
      ext_modules = [Extension('_example',
                               ['example.i','bar_impl.cpp'],
                               include_dirs = [numpy.get_include(),'.'],
                               swig_opts=['-c++'],
                               extra_compile_args=['--std=c++11'] )])
