import multiprocessing as mp

def fibo(n, x):
    a = 0
    b = 1
    print(a)
    if n > 1:
        print(b)
    for i in range(2, n):
        fibo = a + b
        a = b
        b = fibo
        print(fibo)

if __name__ == '__main__':
    n = int(input("n: "))
    h = mp.Process(target=fibo, args=(n, 1))
    h.start()
    h.join()