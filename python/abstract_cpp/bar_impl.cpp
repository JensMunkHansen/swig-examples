#include "bar_impl.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

namespace bar {
/*
  std::vector<std::shared_ptr<BarBase> > BarImpl::Get() {
    std::vector<std::shared_ptr<BarBase> > vec;
    std::shared_ptr<BarBase> base = std::make_shared<BarImpl>();
    vec.push_back(base);
    return vec;
  }
*/
  int BarImpl::BarRefCreate(BarBase*& obj)
  {
    obj = (BarBase*) new BarImpl();
    return 1;
  }
  
  int BarImpl::BarCreate(BarBase** obj)
  {
    *obj = (BarBase*) new BarImpl();
    return 0;
  }

  int BarImpl::BarCreateMany(int* count, bar::BarBase ***objs)
  {
    // TEST: If possible to return BarImpl[3]
    int _count = 2;
    *count = _count;
    *objs = (BarBase**) malloc(_count * sizeof(BarBase*));
    for (int i = 0 ; i < _count ; i++) {
      (*objs)[i] = (BarBase*) new BarImpl();
    }
    return 0;
  }

  int BarImpl::BarCreateMany2(int* cnt, bar::BarBase ***objs)
  {
    int _count = 2;
    *objs = new BarBase*[_count];
    for (int i = 0 ; i < _count ; i++) {
      (*objs)[i] = (BarBase*) new BarImpl();
    }
    *cnt = _count;

    return 0;
  }


  BarImpl::BarImpl()
  {
    printf("BarImpl::BarImpl()\n");
    this->c = NULL;
  }

  BarImpl::~BarImpl()
  {
    printf("BarImpl::~BarImpl()\n");
    if (this->c) {
      free(this->c);
    }
  }

  int BarImpl::bar_set_value_a(int value)
  {
    return 0;
  }

  int BarImpl::bar_get_value_a(int *result)
  {
    *result = 3;
    return 0;
  }

  int BarImpl::bar_get_value_b(char** result)
  {
    *result = (char*) malloc(strlen(this->c)+1);
    strcpy(*result,this->c);
    return 0;
  }

  void BarImpl::bar_get_safe_value_b(char** res, int* sz)
  {
    *sz = strlen(this->c);
    *res = (char*) malloc((*sz) + 1);
    strcpy(*res,this->c);
  }

  int BarImpl::bar_set_value_b(char *value)
  {
    int len = strlen(value);
    if (this->c) {
      free(this->c);
    }
    this->c = (char*)malloc(len+1);
    strcpy(this->c,value);
    return 0;
  }

  int BarImpl::CreateList(ResourceList** obj)
  {
    *obj = new ResourceList();
    size_t nElements = 10;
    (*obj)->count = nElements;
    (*obj)->data = new Element*[nElements];
    for (size_t i = 0 ; i < nElements ; i++) {
      (*obj)->data[i] = new Element();
      strcpy((*obj)->data[i]->name,"Hello\0");
    }
    return 0;
  }

  void ResourceListDestroy(ResourceList* obj)
  {
    delete obj;
  }

}

    #include "bar_impl.hpp"

    #include <cstdio>
    namespace Module {
      int SampleImpl::SampleCreate(Module::SampleBase*& obj) {
        obj = (SampleBase*) new SampleImpl();
        return 0;
      }
      SampleImpl::SampleImpl() {
        printf("SampleImpl::SampleImpl()\n");
      }
    
      SampleImpl::~SampleImpl() {
        printf("SampleImpl::~SampleImpl()\n");
      }
    }
