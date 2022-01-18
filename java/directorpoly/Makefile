# Makefile
JAVA_INCLUDE=-I/usr/lib/jvm/default-java/include/ -I/usr/lib/jvm/default-java/include/linux

all:
	#c++ -c test.hh
	swig -java -c++ $(JAVA_INCLUDE) test.i
	c++ $(JAVA_INCLUDE) -fPIC -c test_wrap.cxx
	c++ -shared -dynamiclib -o libTest.so *.o
	javac *.java -Xlint:deprecation
	LD_LIBRARY_PATH=. java main
clean:
	rm -rf *.class *.o *_wrap.cxx *_wrap.h TestJNI.java Test*.java GameObject.java CollisionListener.java
