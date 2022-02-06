tcl:
	swig -tcl example.i
	gcc -fpic -c example.c example_wrap.c -I/usr/local/include -I/usr/include/tcl8.6
	gcc -shared example.o example_wrap.o -o example_tcl.so

python:
	swig -python example.i
	gcc -fPIC -c example.c example_wrap.c -I/usr/include/python3.9
	ld -fPIC -shared example.o example_wrap.o -o _example.so

perl:
	swig -perl5 example.i
	gcc -c `perl -MConfig -e 'print join(" ", @Config{qw(ccflags optimize cccdlflags)}, "-I@Config{archlib}/CORE")'` example.c example_wrap.c
	gcc -fPIC -shared -lpthread -lperl `perl -MConfig -e 'print $Config{lddlflags}'` example.o example_wrap.o -o example.so
  echo 'export PERL5LIB=$PERL5LIB:.'
	echo './test.pl'

java:
	swig -java example.i
	gcc -fPIC -c example.c example_wrap.c -I/usr/lib/jvm/java-11-openjdk-amd64/include/ -I/usr/lib/jvm/java-11-openjdk-amd64/include/linux
	gcc -fPIC -shared example.o  example_wrap.o -o libexample.so
	echo 'java main'

csharp:
	swig -csharp  example.i
	gcc -c -fpic  example.c example_wrap.c
	gcc -shared example.o  example_wrap.o   -o libexample.so
	mcs -o runme *.cs

clean:
	rm -f *.o example_wrap* *.so example.class main.class example.pm runme examplePINVOKE.cs exampleJNI.* example.java
