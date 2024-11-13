import java.util.*;

public class e1004 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        
        for (int i = 0; i < t; i++) {
            int n = sc.nextInt();
            int m = sc.nextInt();
            sc.nextLine(); // Limpiar el salto de línea después de leer los enteros
            
            char[][] lab = new char[n][m];
            for (int j = 0; j < n; j++) {
                lab[j] = sc.nextLine().toCharArray();
            }
            
            int x1 = sc.nextInt();
            int y1 = sc.nextInt();
            int x2 = sc.nextInt();
            int y2 = sc.nextInt();
            
            int res = bfs(n, m, lab, x1, y1, x2, y2);
            System.out.println("Laberinto #" + (i + 1) + ": " + res);
        }
    }

    public static int bfs(int n, int m, char[][] lab, int x1, int y1, int x2, int y2) {
        int[] dx = {-1, 1, 0, 0};
        int[] dy = {0, 0, -1, 1};
        int[][] dist = new int[n][m];
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                dist[i][j] = Integer.MAX_VALUE;
            }
        }
        
        dist[x1][y1] = 0;
        Queue<int[]> queue = new LinkedList<>();
        queue.add(new int[]{x1, y1});
        
        while (!queue.isEmpty()) {
            int[] current = queue.poll();
            int x = current[0];
            int y = current[1];
            
            for (int i = 0; i < 4; i++) {
                int nx = x + dx[i];
                int ny = y + dy[i];
                
                if (nx >= 0 && nx < n && ny >= 0 && ny < m) {
                    if (lab[nx][ny] == '.' && dist[nx][ny] == Integer.MAX_VALUE) {
                        dist[nx][ny] = dist[x][y];  // No rompe pared
                        queue.add(new int[]{nx, ny});
                    } else if (lab[nx][ny] == '#' && dist[nx][ny] == Integer.MAX_VALUE) {
                        dist[nx][ny] = dist[x][y] + 1;  // Rompe pared
                        queue.add(new int[]{nx, ny});
                    }
                }
            }
        }
        
        return dist[x2][y2] == Integer.MAX_VALUE ? -1 : dist[x2][y2];  // Si no es alcanzable, -1
    }
}
