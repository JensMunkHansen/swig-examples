#include<string>
#include<boost/python.hpp>

using std::string;
namespace py=boost::python;

struct Base{
  virtual string foo() const { return "Base.foo"; }
  // fooBase is non-virtual, calling it from anywhere (c++ or python)
  // will go through c++ dispatch
  string fooBase() const { return foo(); }
};
struct BaseWrapper: Base, py::wrapper<Base>{
  string foo() const{
    // if Base were abstract (non-instantiable in python), then
    // there would be only this->get_override("foo")() here
    //
    // if called on a class which overrides foo in python
    if(this->get_override("foo")) return this->get_override("foo")();
    // no override in python; happens if Base(Wrapper) is instantiated directly
    else return Base::foo();
  }
};

BOOST_PYTHON_MODULE(baz){
  py::class_<BaseWrapper,boost::noncopyable>("Base")
    .def("foo",&Base::foo)
    .def("fooBase",&Base::fooBase)
  ;
}
