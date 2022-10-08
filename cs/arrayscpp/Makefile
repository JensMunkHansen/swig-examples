all:
	swig -csharp -c++ test.i
	g++ -c -fPIC test.cpp test_wrap.cxx
	g++ -shared test.o  test_wrap.o -o libtest.so
	mono-csc -out:runme.exe -unsafe *.cs
	cat runme.cs
clean:
	rm -f test.cs test.o test_wrap.cxx test_wrap.o testPINVOKE.cs libtest.so runme.exe SWIGTYPE_p_int.cs
