%module example

%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
%}

%include <pybuffer.i>
%pybuffer_mutable_string(char* str1)
%pybuffer_string(const char* str2)
%pybuffer_mutable_binary(char* str3, size_t size)
%pybuffer_binary(const char* str4, size_t size)

%inline %{

void strupr(char* p) {
  while( *p ) {
    *p=toupper( *p );
    p++;
  }
}
void funcms(char *str1) {
    strupr(str1);
}

size_t funcs(const char *str2) {
    return strlen(str2);
}

void funcmb(char* str3, size_t size) {
    memset(str3,'A',size);
}

size_t funcb(const char* str4, size_t size) {
    size_t tmp = 0;
    for(size_t i = 0; i < size; ++i)
        tmp += str4[i];
    return tmp % 256;
}
%}
