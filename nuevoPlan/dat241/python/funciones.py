def suma(a, b):
    return a + b

def multi(a, b):
    return a*b

def operacion(f, a, b):
    return f(a, b)


print(suma(5, 6))
print(multi(5, 6))
print(operacion(suma, 5, 6))
# ^ composicion

# multiplicación en base a sumas, 3 líneas

l4 = [i for i in range(6)]
print(l4)

def multiConSuma(a, b):
    return sum([b for i in range(a)])

print(multiConSuma(2, 3))