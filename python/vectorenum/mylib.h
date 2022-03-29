#include <vector>

namespace testing
{
  typedef enum
      {
        Ok = 0,
        Error = 1,
      } Status;

  class Algo
  {

 public:
    void Run(const std::vector<double> & in, std::vector<int> & out, std::vector<testing::Status> & status)
    {
      status.resize(in.size());
      out.resize(in.size());
      for (int i=0; i<in.size(); ++i) {
        out[i] = i;
        status[i] = Status::Ok;
      }
    }
  };
}
