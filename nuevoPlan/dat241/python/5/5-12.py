import multiprocessing as mp

def proceso():
    print("Hilo\n")

if __name__ == '__main__':
    h = mp.Process(target = proceso)
    h.start()
    h.join()