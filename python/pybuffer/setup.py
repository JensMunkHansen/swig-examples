# setup.py

from distutils.core import setup, Extension

setup(name="example",
      py_modules=['example'],
      ext_modules=[Extension("_example",
                     ["test.i"],
                     swig_opts=[],
    extra_compile_args=[]
                  )]

)
