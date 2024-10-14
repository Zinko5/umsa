t = int(input())
for _ in range(t):
    n = int(input())
    a = [list(map(int, input().split())) for _ in range(n)]
    bienOrdenado = True
    for i in range(n):
        for j in range(n):
            if a[i][j] != 1:
                encontrado = False
                for s in range(n):
                    for t in range(n):
                        if a[i][j] == a[i][s] + a[t][j]:
                            encontrado = True
                            break
                    if encontrado:
                        break
                if not encontrado:
                    bienOrdenado = False
                    break
        if not bienOrdenado:
            break
    print("Si" if bienOrdenado else "No")
