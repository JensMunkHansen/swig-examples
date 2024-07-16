# Attempt to use pkg-config to get Python flags
PYTHON_CFLAGS := $(shell pkg-config --cflags python3)
PYTHON_LDFLAGS := $(shell pkg-config --libs python3)

# If pkg-config fails, use python3-config as a fallback
ifeq ($(PYTHON_CFLAGS),)
    PYTHON_CFLAGS := $(shell python3-config --cflags)
endif

ifeq ($(PYTHON_LDFLAGS),)
    PYTHON_LDFLAGS := $(shell python3-config --ldflags)
    PYTHON_LIBS := $(shell python3-config --libs)
endif

LDFLAGS = $(PYTHON_LDFLAGS) $(PYTHON_LIBS)

myif_wrap.cxx runtime.h: myif.i myif.h
	swig -python -c++ -Wall myif.i
	swig -python -c++ -Wall -external-runtime runtime.h

_module.so: myif_wrap.cxx
	g++ -DSWIG_TYPE_TABLE=myif -fPIC -std=c++11 -Wall -Wextra -shared -o _module.so myif_wrap.cxx $(PYTHON_CFLAGS)  $(LDFLAGS)

main: main.cc _module.so
	g++ -Wall -Wextra -std=c++11 $(PYTHON_CFLAGS)  main.cc -o main $(LDFLAGS)

main1: main1.cc runtime.h
	g++ -DSWIG_TYPE_TABLE=myif -Wall -Wextra -std=c++11 $(PYTHON_CFLAGS)  main1.cc -o main1 $(LDFLAGS)

all: main main1 _module.so

clean:
	rm -f _module.so main main1 myif_wrap.cxx myif_wrap.h runtime.h *.pyc module.py
