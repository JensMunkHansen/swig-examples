# setup.py

from distutils.core import setup, Extension

setup(name="x",
      py_modules=['x'],
      ext_modules=[Extension("_x",
                     ["x.i"],
                     swig_opts=['-c++'],
    extra_compile_args=['--std=c++0x']
                  )]
)
