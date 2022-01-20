import module

class MyCl(module.myif):
  def __init__(self):
    module.myif.__init__(self)
  def myfunc(self,a):
    return a*2.0

cl = MyCl()
print(cl.myfunc(100.0))
module.runCode(cl)
