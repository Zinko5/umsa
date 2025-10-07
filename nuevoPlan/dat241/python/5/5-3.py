import numpy as np

lista = [0, 1, 2, 3, 4 ,5 ,6 , 7, 8, 9]

lista2 = [[10, 11, 12, 13], [11, 22, 33, 44], [44, 6, 7, 2]]
lista3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

matriz1 = np.array(lista2)
matriz2 = np.reshape(lista3, (2, 6))

print(matriz1)
print(matriz2)
print(len(matriz1))
print(len(matriz2))

print(matriz1.shape)
print(matriz2.shape)
