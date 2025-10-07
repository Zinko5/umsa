import multiprocessing as mp
import time

def proceso1():
    print("Inicio hilo\n")
    time.sleep(3)
    print("Fin hilo")

def proceso2():
    print("Inicio hilo\n")
    time.sleep(1)
    print("Fin hilo")

if __name__ == '__main__':
    h1 = mp.Process(target = proceso1)
    h2 = mp.Process(target = proceso2)

    h1.start()
    h2.start()

    h1.join()
    h2.join()