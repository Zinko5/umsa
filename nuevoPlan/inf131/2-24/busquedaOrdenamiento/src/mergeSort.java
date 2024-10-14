import java.util.LinkedList;
import java.util.Queue;

import javax.management.QueryEval;

public class mergeSort {
    public static void main(String[] args) {
        int v[] = new int[4];
        v[0] = 10;
        v[1] = 1;
        v[2] = 5;
        v[3] = 15;
        mostrar(v);
        merge(v, 0, v.length - 1);
        mostrar(v);
    }

    static void mostrar(int v[]){
        for (int i = 0; i < v.length; i++) {
            System.out.print("[" + v[i] + "]");
        }
        System.out.println();
    }

    // static void merge(int v[], int l, int r){
    //     if (l == r) {
    //         return;
    //     }
    //     int mid = (l + r) / 2;
    //     merge(v, l, mid);
    //     merge(v, mid + 1, r);
    //     Queue<Integer> L = new LinkedList<Integer>();
    //     Queue<Integer> R = new LinkedList<Integer>();
    //     for (int i = l; i < mid + 1; i++) {
    //         L.offer(v[i]);
    //     }
    //     for (int i = mid + 1; i < r + 1; i++) {
    //         R.offer(v[i]);
    //     }
    //     for (int i = l; i < r + 1; i++) {
    //         if (L.size() == 0) {
    //             v[i] = R.poll();
    //         }
    //         else if (R.size() == 0) {
    //             v[i] = L.poll();
    //         }
    //         else if (L.peek() > R.peek()) {
    //             v[i] = L.poll();
    //         }
    //         else{
    //             v[i] = R.poll();
    //         }
    //     }
    // }

    static void merge(int v[], int l, int r){
        if (l == r) {
            return;
        }
        int mid = (l + r) / 2;
        merge(v, l, mid);
        merge(v, mid + 1, r);
        Queue<Integer> L  = new LinkedList<Integer>();
        Queue<Integer> R = new LinkedList<Integer>();
        for (int i = l; i < mid + 1; i++) {
            L.offer(v[i]);
        }
        for (int i = mid + 1; i < r + 1; i++) {
            R.offer(v[i]);
        }
        for (int i = l; i < r + 1; i++) {
            if (L.size() == 0) {
                v[i] = R.poll();
            }
            else if (R.size() == 0) {
                v[i] = L.poll();
            }
            else if (L.peek() > R.peek()) {
                v[i] = L.poll();
            }
            else {
                v[i] = R.poll();
            }
        }
    }
}
