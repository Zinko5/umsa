import math

def esPrimo(num):
    if num < 2:
        return False
    if num in (2, 3):
        return True
    if num % 2 == 0 or num % 3 == 0:
        return False
    i = 5
    while i * i <= num:
        if num % i == 0 or num % (i + 2) == 0:
            return False
        i += 6
    return True

def contarGrafosConexos(minimo, maximo):
    nodos = list(range(minimo, maximo + 1))
    grafo = {nodo: set() for nodo in nodos}
    
    for i in nodos:
        for j in nodos:
            if i < j and esPrimo(i + j):
                grafo[i].add(j)
                grafo[j].add(i)
    
    visitados = set()
    componentesConexas = 0
    
    def dfs(nodo):
        pila = [nodo]
        while pila:
            n = pila.pop()
            for vecino in grafo[n]:
                if vecino not in visitados:
                    visitados.add(vecino)
                    pila.append(vecino)

    for nodo in nodos:
        if nodo not in visitados:
            visitados.add(nodo)
            componentesConexas += 1
            dfs(nodo)
    
    return componentesConexas

salida = []
try:
    while True:
        entrada = input().strip()
        minimo, maximo = map(int, entrada.split())
        if minimo == 0 and maximo == 0:
            break
        salida.append(contarGrafosConexos(minimo, maximo))

    print("\n".join(map(str, salida)))
except EOFError:
    pass
