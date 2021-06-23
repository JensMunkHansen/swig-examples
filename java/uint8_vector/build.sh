#!/bin/sh
swig -java -Wall test.i
gcc -Wall -Wextra -o libtest.so -I/usr/lib/jvm/default-java/include/ -I/usr/lib/jvm/default-java/include/linux test_wrap.c -shared 
javac *.java  -Xlint:deprecation 
LD_LIBRARY_PATH=. java run
