# Saliendo del laberinto
from collections import deque

def bfs(n, m, lab, x1, y1, x2, y2):
    direcciones = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    dist = [[float('inf')] * m for _ in range(n)]
    dist[x1][y1] = 0
    q = deque([(x1, y1)])
    
    while q:
        x, y = q.popleft()
        for dx, dy in direcciones:
            nx, ny = x + dx, y + dy
            if 0 <= nx < n and 0 <= ny < m:
                if lab[nx][ny] == '.' and dist[nx][ny] == float('inf'):
                    dist[nx][ny] = dist[x][y]
                    q.appendleft((nx, ny))
                elif lab[nx][ny] == '#' and dist[nx][ny] == float('inf'):
                    dist[nx][ny] = dist[x][y] + 1
                    q.append((nx, ny))
    
    return dist[x2][y2]

t = int(input())
for i in range(t):
    n, m = map(int, input().split())
    lab = [input().strip() for _ in range(n)]
    x1, y1 = map(int, input().split())
    x2, y2 = map(int, input().split())
    res = bfs(n, m, lab, x1, y1, x2, y2)
    print(f"Laberinto #{i + 1}: {res}")
