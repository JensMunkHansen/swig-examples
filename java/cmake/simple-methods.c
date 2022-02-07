#include "simple-methods.h"
#include "stdio.h"

int print_args(char **argv) {
  int i = 0;
  while (argv[i]) {
    printf("argv[%d] = %s\n", i, argv[i]);
    i++;
  }
  return i;
}

char **get_args() {
  static char *values[] = { "Dave", "Mike", "Susan", "John", "Michelle", 0};
  return &values[0];
}
char* get_me() {
  char* res;
  char c[] = "Hello World";
  size_t sz = strlen(c);
  res = (char*) malloc(sz + 1);
  strcpy(res,c);
  return res;
}

int get_string(char** res) {
  char c[] = "Hello World";
  size_t sz = strlen(c);
  *res = (char*) malloc(sz + 1);
  strcpy(*res,c);
  return 0;
}
