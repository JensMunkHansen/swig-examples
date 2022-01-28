# setup.py

from distutils.core import setup, Extension

setup(name="core",
      py_modules=['core'],
      ext_modules=[Extension("_core",
                     ["core.i"],
                     swig_opts=['-c++'],
    extra_compile_args=['--std=c++11', '-DSWIG_DIRECTOR_NORTTI']
                  )]

)
