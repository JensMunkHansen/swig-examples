all:
	swig -csharp example.i
	gcc -c -fPIC example.c example_wrap.c
	gcc -shared example.o  example_wrap.o   -o libexample.so
	mono-csc -out:runme.exe *.cs
	cat runme.cs
clean:
	rm -f example.cs example.o example_wrap.c example_wrap.o examplePINVOKE.cs libexample.so runme.exe
