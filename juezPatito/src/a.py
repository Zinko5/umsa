def es_numero_feliz(n):
    visitados = set()
    while n != 1 and n not in visitados:
        visitados.add(n)
        n = sum(int(d) ** 2 for d in str(n))
    return n == 1

num_casos = int(input())
resultados = []
for _ in range(num_casos):
    n = int(input())
    resultados.append("Feliz" if es_numero_feliz(n) else "Triste")

for resultado in resultados:
    print(resultado)
