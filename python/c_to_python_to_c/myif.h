// myif.h
class myif {
   public:
     virtual float myfunc(float a) = 0;
     virtual ~myif() = default;
};

inline void runCode(myif *inst) {
  std::cout << inst->myfunc(5) << std::endl;
}
