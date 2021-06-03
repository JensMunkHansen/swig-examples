@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" x64


IF EXIST "C:\ProgramData\Anaconda3\Scripts\activate.bat" (
  call "C:\ProgramData\Anaconda3\Scripts\activate.bat"
)

python setup.py build_ext --inplace
