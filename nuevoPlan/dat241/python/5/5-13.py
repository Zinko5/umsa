import multiprocessing as mp
import time

def proceso():
    print("Inicio hilo\n")
    time.sleep(2)
    print("Fin hilo")

if __name__ == '__main__':
    h = mp.Process(target = proceso)
    h.start()
    h.join()