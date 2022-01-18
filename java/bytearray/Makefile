all:
	gcc -c mymodule.c
	swig -java -Wall mymodule.i
	gcc -Wall -Wextra -o libmymodule.so -I/usr/lib/jvm/default-java/include/ -I/usr/lib/jvm/default-java/include/linux mymodule_wrap.c -shared
	javac *.java  -Xlint:deprecation
