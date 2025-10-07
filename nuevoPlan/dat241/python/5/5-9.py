a = 5
b = 5
s = 0

def suma(a, b):
    return a + b

def multi(a, b):
    return sum([a for i in range(b)])

def composicion(f, a, b):
    return f(a, b)

print(composicion(multi, 5, 7))