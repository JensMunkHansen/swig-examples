from example import A as parentA

class A(parentA):
  def __init__(self):
    super(A,self).__init__()
  def SmartMethod(self):
    return 2
  @staticmethod
  def Create():
      retval, obj = parentA.Create();
      #setattr(parentA, 'SmartMethod', A.SmartMethod)
      obj.__class__ = A
      return obj
