all:
	swig -c++ -csharp Mock.i
	g++ -c -fPIC Mock.cpp Mock_wrap.cxx
	g++ -shared Mock.o Mock_wrap.o -o libMock.so
	#mono-csc -out:runme.exe -unsafe *.cs
	#cat runme.cs
clean:
	rm -f Mock.cs Mock.o Mock_wrap.cxx Mock_wrap.o MockPINVOKE.cs libMock.so Mock_wrap.h mock_wrap.cs Otto.cs IntMap.cs IntVector.cs mock_wrapPINVOKE.cs myPtr_s.cs runme.exe
