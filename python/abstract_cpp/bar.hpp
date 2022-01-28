#pragma once

namespace bar {
  class BarBase {
  public:
#ifndef SWIG
    static int BarCreate(BarBase **obj);
#endif
    virtual int bar_get_value_a(int *result) = 0;
    virtual int bar_set_value_a(int value) = 0;

    virtual int bar_get_value_b(char **result) = 0;
    virtual int bar_set_value_b(char *value) = 0;
    virtual void bar_get_safe_value_b(char** res, int* sz) = 0;

    virtual ~BarBase() {};//= default;
  };
}

    namespace Module {
      class SampleBase {
      public:
    #ifndef SWIG
        static int SampleCreate(SampleBase *&obj);
    #endif
        virtual ~SampleBase() = default;
      };
    }
