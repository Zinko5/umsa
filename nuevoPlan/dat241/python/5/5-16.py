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
    hilos = [mp.Process(target = proceso, args = ("Hilo " + str(i), i)) for i in range(5)]

    for i in hilos:
        i.start()

    for i in hilos:
        i.join()
