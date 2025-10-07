from multiprocessing import Pool

def cuadrado(n):
    return n**2

if __name__ == '__main__':
    lista10 = [1, 2, 3, 4, 5]
    with Pool() as pool:
        resultados = pool.map(cuadrado, lista10)
    
    print(resultados)