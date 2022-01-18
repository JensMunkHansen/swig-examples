# Makefile
JAVA_INCLUDE=-I/usr/lib/jvm/default-java/include/ -I/usr/lib/jvm/default-java/include/linux

all:
	c++ -c c_backend.cpp
	swig -java -c++ $(JAVA_INCLUDE) c_backend.i
	c++ $(JAVA_INCLUDE) -fPIC -c c_backend_wrap.cxx
	c++ -shared -dynamiclib -o libCBackend.so *.o
	javac *.java -Xlint:deprecation
	LD_LIBRARY_PATH=. java JavaFrontend
clean:
	rm -rf *.class *.o *_wrap.cxx *_wrap.h Server.java SWIGTYPE*.java c_backend*.java JobPool.java Person.java
