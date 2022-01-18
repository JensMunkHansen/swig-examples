// c_backend.h
#ifndef C_BACKEND_H
#define C_BACKEND_H

#include <stdio.h>

class Person {
public:
  virtual ~Person() {}
  virtual void doSomeWorkForMe(int i) {
    printf("in C++ doSomeWorkForMe %i\n",i);
  }
};

class JobPool {
public:
  virtual ~JobPool() {}
  virtual Person *hireSomeone() {
    printf("in C++ hireSomeone\n");
    return NULL;
  }
  virtual void returnToJobPool(Person *person) {
    printf("in C++ returnToJobPool\n");
  }
};


class Server {
public:
  void doSomething( JobPool * );
};

#endif
