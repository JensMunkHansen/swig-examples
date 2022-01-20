import sys
sys.path.append('.')
import baz

class PyDerived(baz.Base):
  def foo(self): return 'PyDerived.foo'

base=baz.Base()
der=PyDerived()
print base.foo(), base.fooBase()
print der.foo(), der.fooBase()
