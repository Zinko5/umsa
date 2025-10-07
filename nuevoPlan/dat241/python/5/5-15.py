import multiprocessing as mp
import time

def proceso(nombre, secuencia):
    print("Inicio  " + nombre + "\n")
    if secuencia % 2 == 0:
        time.sleep(3)
    else:
        time.sleep(1)
    print("Fin " + nombre + "\n")

if __name__ == '__main__':
    hilos = []

    h1 = mp.Process(target = proceso, args = ("Hilo 1", 1))

    h1.start()
    h1.join()
    