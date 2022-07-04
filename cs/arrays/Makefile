all:
	swig -csharp test.i
	gcc -c -fPIC test.c test_wrap.c
	gcc -shared test.o  test_wrap.o -o libtest.so
	mono-csc -out:runme.exe -unsafe *.cs
	cat runme.cs
clean:
	rm -f test.cs test.o test_wrap.c test_wrap.o testPINVOKE.cs libtest.so runme.exe SWIGTYPE_p_int.cs
