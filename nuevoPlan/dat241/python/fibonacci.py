# a = 0
# b = 1
a, b = 0, 1
for i in range(10):
    # aux = a + b
    # a = b
    # b = aux
    a, b = b, a + b
print(b)

# Código pythónico