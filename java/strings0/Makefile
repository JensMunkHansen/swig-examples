java:
	swig -java example.i
	gcc -fPIC -c example_wrap.c -I/usr/lib/jvm/java-8-openjdk-amd64/include/ -I/usr/lib/jvm/java-8-openjdk-amd64/include/linux
	gcc -fPIC -shared example_wrap.o -o libexample.so

clean:
	rm -f exampleJNI.java example.java example_wrap.o example_wrap.c libexample.so
# swig -java example.i
# gcc -c example.c example_wrap.c -I/c/jdk1.3.1/include -I/c/jdk1.3.1/include/win32
# gcc -shared example.o  example_wrap.o -mno-cygwin -Wl,--add-stdcall-alias  -o example.dll
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
