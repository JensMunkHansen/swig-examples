#pragma once

class Die
{
public:
    Die(int a);
    ~Die();
    int foo(int a);
    int myVar;
};

extern "C" 
{
    Die* getDie(int a);
}
