autodoc:
	swig -python -features autodoc example.i
	gcc -fPIC -c example.c example_wrap.c \
        -I/usr/include/python3.9
	ld -shared example.o example_wrap.o -o _example.so

doxygen:
	doxygen -g
	sed -i 's/GENERATE_XML           = NO/GENERATE_XML = YES/g' Doxyfile
	python doxy2swig.py -c -a ./xml/index.xml documentation.i
	swig -python example.i
	gcc -fPIC -c example.c example_wrap.c -I/usr/include/python2.7
	ld -shared example.o example_wrap.o -o _example.so
clean:
	rm -f *wrap.c *.o *.pyc example.py *.so
