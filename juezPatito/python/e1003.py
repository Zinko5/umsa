# Rumores
# Juez patito no lo acepta porque está bugueado, 
# def dfs(grafo, visitados, nodo):
#     visitados[nodo] = True
#     for vecino in grafo[nodo]:
#         if not visitados[vecino]:
#             dfs(grafo, visitados, vecino)

# t = int(input())
# for _ in range(t):
#     n, m = map(int, input().split())
#     grafo = [[] for _ in range(n + 1)]
#     for _ in range(m):
#         u, v = map(int, input().split())
#         grafo[u].append(v)
#         grafo[v].append(u)
#     x, y = map(int, input().split())
    
#     visitados = [False] * (n + 1)
#     dfs(grafo, visitados, x)
    
#     if visitados[y]:
#         print("SI")
#     else:
#         print("NO")
