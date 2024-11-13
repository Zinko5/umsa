"""
Grupo "AULAS"
"""

class Aula:
    def init(self, nombre, capacidad, ubicacion):
        self.nombre = nombre         
        self.capacidad = capacidad   
        self.ubicacion = ubicacion   
    
    def repr(self):
        return f"Aula(nombre='{self.nombre}', capacidad={self.capacidad}, ubicacion='{self.ubicacion}')"

class Pila:
    def init(self):
        self.elementos = []
    
    def push(self, aula):
        self.elementos.append(aula)
    
    def pop(self):
        if self.is_empty():
            return 'La pila está vacía'
        return self.elementos.pop()
    
    def peek(self):
        if self.is_empty():
            return 'La pila está vacía'
        return self.elementos[-1]
    
    def is_empty(self):
        return len(self.elementos) == 0
    
    def size(self):
        return len(self.elementos)
    
    def clear(self):
        self.elementos = []

    def get_elements(self):
        return self.elementos.copy()

def ordenar_por_nombre(pila):
    aulas = pila.get_elements()
    aulas_ordenadas = sorted(aulas, key=lambda aula: aula.nombre)
    return aulas_ordenadas

def ordenar_por_capacidad(pila):
    aulas = pila.get_elements()
    aulas_ordenadas = sorted(aulas, key=lambda aula: aula.capacidad)
    return aulas_ordenadas

def ordenar_por_ubicacion(pila):
    aulas = pila.get_elements()
    aulas_ordenadas = sorted(aulas, key=lambda aula: aula.ubicacion)
    return aulas_ordenadas

if name == "main":
    pila_aulas = Pila()
    
    aula1 = Aula(nombre="Aula Magna", capacidad=200, ubicacion="Edificio A")
    aula2 = Aula(nombre="Laboratorio 1", capacidad=30, ubicacion="Edificio B")
    aula3 = Aula(nombre="Sala de Conferencias", capacidad=100, ubicacion="Edificio C")
    aula4 = Aula(nombre="Aula 101", capacidad=50, ubicacion="Edificio A")
    
    pila_aulas.push(aula1)
    pila_aulas.push(aula2)
    pila_aulas.push(aula3)
    pila_aulas.push(aula4)
    
    # Ordenar las aulas por nombre
    aulas_ordenadas_nombre = ordenar_por_nombre(pila_aulas)
    print("Aulas ordenadas por nombre:")
    for aula in aulas_ordenadas_nombre:
        print(aula)
    
    # Ordenar las aulas por capacidad
    aulas_ordenadas_capacidad = ordenar_por_capacidad(pila_aulas)
    print("\nAulas ordenadas por capacidad:")
    for aula in aulas_ordenadas_capacidad:
        print(aula)
    
    # Ordenar las aulas por ubicación
    aulas_ordenadas_ubicacion = ordenar_por_ubicacion(pila_aulas)
    print("\nAulas ordenadas por ubicación:")
    for aula in aulas_ordenadas_ubicacion:
        print(aula)