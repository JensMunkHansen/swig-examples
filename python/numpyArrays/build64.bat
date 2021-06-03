@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" x64

set PATH=%PATH%;c:\PFx64\swig

c:\Users\jem\AppData\Local\Programs\Python\Python39\python.exe setup.py build_ext --inplace

REM c:\Users\jem\Environments\PyPI39\Scripts\python.exe setup.py build --inplace
