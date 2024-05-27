all:
	#swig -c++ -javascript -jsc example.i
	# swig -c++ -javascript -v8 -DV8_VERSION=0x032530 example.i # <4.3.0
	#swig -c++ -javascript -v8 example.i
	swig -c++ -javascript -node example.i
	c++ -fPIC -c -I/usr/include/node example_wrap.cxx
	c++ -shared -dynamiclib -o libexample.so *.o
	node-gyp configure build

#make check-javascript-examples ENGINE=jsc
#make check-javascript-test-suite ENGINE=jsc
#make check-javascript-examples V8_VERSION=0x032530 ENGINE=v8
# node, jsc, v8
