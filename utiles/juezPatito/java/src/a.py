t = int(input())
for _ in range(t):
    c = int(input())
    complejidad = 1
    for _ in range(c):
        linea = input()
        if 'for(' in linea:
            complejidad *= n := linea.count('for(')
    print(f"O(n^{complejidad})")
