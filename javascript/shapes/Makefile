all:
	swig -c++ -javascript -node example.i
	c++ -fPIC -c -I/usr/include/node example_wrap.cxx
	c++ -shared -dynamiclib -o libexample.so *.o
	node-gyp configure build
