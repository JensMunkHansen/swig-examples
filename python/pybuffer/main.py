import example as test
b=bytearray(b'abc')  # mutable string (nul-terminated)
test.funcms(b)
b
test.funcs(b'abc')   # immutable string (nul-terminated)
b=bytearray(b'ab\0cd\0ef')  # mutable data (includes nulls)
test.funcmb(b)
b
test.funcb(b'ab\0cd\0ef')   # immutable data (compute byte checksum)
sum(b'ab\0cd\0ef')%256      # verify result
