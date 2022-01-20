myif_wrap.cxx runtime.h: myif.i myif.h
	swig -python -c++ -Wall myif.i
# Create runtime information
	swig -python -c++ -Wall -external-runtime runtime.h

_module.so: myif_wrap.cxx
#	g++ -Wall -fPIC -std=c++11 -Wextra -shared -o _module.so myif_wrap.cxx -I/usr/include/python3.9 -lpython3.9
	g++ -DSWIG_TYPE_TABLE=myif -fPIC -std=c++11 -Wall -Wextra -shared -o _module.so myif_wrap.cxx -I/usr/include/python3.9 -lpython3.9
#	g++ -DSWIG_TYPE_TABLE=myif -fPIC -Wall -Wextra -shared -o _module.so myif_wrap.cxx -I/usr/include/python3.9 -lpython3.9

main: main.cc _module.so
	g++ -Wall -Wextra -std=c++11 -I/usr/include/python3.9 main.cc -o main -lpython3.9

main1: main1.cc runtime.h
	g++ -DSWIG_TYPE_TABLE=myif -Wall -Wextra -std=c++11 -I/usr/include/python3.9 main1.cc -o main1 -lpython3.9

all: main main1 _module.so

clean:
	rm -f _module.so main main1 myif_wrap.cxx myif_wrap.h runtime.h *.pyc module.py
