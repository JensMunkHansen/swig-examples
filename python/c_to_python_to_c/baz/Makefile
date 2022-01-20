default:
	g++ -shared -I/usr/include/python3.9 -L/usr/lib/x86_64-linux-gnu -fPIC -o baz.so baz.cpp -lboost_python `pkg-config python3 --cflags`
clean:
	rm -f baz.so *.pyc *~
