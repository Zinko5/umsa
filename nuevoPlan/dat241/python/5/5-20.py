from multiprocessing import Pool
import time

def fibo(n):
    if n == 0 or n == 1:
        return 1
    else:
        return fibo(n - 1) + fibo(n - 2)
    
if __name__ == '__main__':
    lista10 = [1, 2, 3, 4, 5, 20, 35]

    inicio = time.time()
    lista11 = [fibo(i) for i in lista10]
    fin = time.time()

    total = fin - inicio
    print(lista11, +  total)

    inicio = time.time()
    with Pool() as pool:
        resultados = pool.map(fibo, lista10)
    fin = time.time()

    total = fin - inicio
    print(resultados, total)    