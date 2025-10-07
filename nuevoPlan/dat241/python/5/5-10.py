import numpy as np

lista3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

matriz2 = np.reshape(lista3, (2, 6))

print(np.sum(matriz2))
print(np.sum(matriz2, axis = None))
print(np.sum(matriz2, axis = 0))
print(np.sum(matriz2, axis = 1))
