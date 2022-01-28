import example as bar

f = bar.BarImpl()
del f

f = bar.BarImpl_BarCreate()[1]
f.bar_set_value_b('Hello world!')
s = f.bar_get_value_b()
