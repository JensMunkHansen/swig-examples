#include <utility>
#include <tuple>

class MyFile {
public:
  std::pair<int,int> version() const noexcept {
    return {version_major_, version_minor_};
  }
private:
 int version_major_;
 int version_minor_;
};
