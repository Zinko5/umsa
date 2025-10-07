import math
from multiprocessing import Pool
import time

def fibomath(n):
    ro = (1 + math.sqrt(5)) / 2
    return  int((ro ** n - (-ro ** -1) ** n) / math.sqrt(5))

if __name__ == '__main__':
    lista10 = [1, 2, 3, 4, 5, 20, 35]

    inicio = time.time()

    with Pool() as pool:
        resultados = pool.map(fibomath, lista10)

    fin = time.time()

    total = fin - inicio

    print(resultados, total)