#include <iostream>
#include "example.h"
int Die::foo(int a) 
{
    std::cout << "foo: running fact from simple_ex" << std::endl;
    return 1;
}

Die::Die(int a)
{
    myVar = a;
}

Die::~Die()
{

}

extern "C" 
{

    Die* getDie(int a) 
    {
        return new Die(a);
    }

}
