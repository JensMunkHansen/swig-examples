all:
	swig -python -c++ -Wall test.i
	g++ -shared -o _test.so test_wrap.cxx fun1.cc -Wall -Wextra -fPIC -I/usr/include/python3.9/ -std=c++11 -DSWIGRUNTIME=extern
	LD_LIBRARY_PATH=. python run.py
