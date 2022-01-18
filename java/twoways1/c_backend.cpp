// c_backend.cpp
#include "c_backend.h"

#include <stdio.h>

void Server::doSomething( JobPool *jp ) {
  printf("In doSomthing\n");
  Person *person = jp->hireSomeone();
  person->doSomeWorkForMe(3);
  jp->returnToJobPool(person);
  printf("exiting doSomthing\n");
}
