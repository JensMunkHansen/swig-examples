import MyNumbers
try:
    MyNumbers.fact(11)
except MyNumbers.TooBigException as e:
    print(e)
    print(type(e))
    e.blahblah()
