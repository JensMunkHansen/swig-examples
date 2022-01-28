#pragma once
#include "bar.hpp"
#include <cstdlib>

//#include <vector>
//#include <memory>

namespace bar {

  typedef struct Element {
    char name[16];
  } Element;

  class ResourceList {
  public:
    ResourceList() : data(NULL), count(0U)
    {
    }
    ~ResourceList()
    {
      if (data) {
        for (size_t i = 0 ; i < count ; i++) {
          delete data[i];
        }
        delete[] data;
      }
    }
    const Element& operator[](const size_t i) const
    {
      return *data[i];
    }
    Element** data;
    size_t count;
  };

  void ResourceListDestroy(ResourceList* obj);

  class BarImpl : public BarBase {
  public:

    //    static std::vector<std::shared_ptr<BarBase> > Get();

    static int BarRefCreate(BarBase*& obj);
    
    static int BarCreate(bar::BarBase **obj);
    static int BarCreateMany(int* count, bar::BarBase ***objs);
    static int BarCreateMany2(int* cnt, bar::BarBase ***objs);

    BarImpl();
    virtual ~BarImpl();
    virtual int bar_get_value_a(int *result);
    virtual int bar_set_value_a(int value);

    virtual int bar_get_value_b(char** result);
    virtual void bar_get_safe_value_b(char** res, int* sz);
    virtual int bar_set_value_b(char *value);

    int CreateList(bar::ResourceList** obj);
  private:
    char* c;
  };
}

namespace Module {
  class SampleImpl : public SampleBase {
  public:
    static int SampleCreate(Module::SampleBase *&obj);

    SampleImpl();
    virtual ~SampleImpl();
  private:
    float a;
  };
}
