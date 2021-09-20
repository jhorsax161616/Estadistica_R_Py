from numpy import array
from scipy.stats import chi2_contingency

def run():

    instructions()

    data= data_entry()

    chi2, p_Valor, gl, expected = chi2_contingency(data)

    observed = array(data, dtype=float)

    print('\n===RESULTADOS===\n')

    print(f'Frecuencias Observadas: \n{observed}')
    print(f'\nFrecuencias Esperadas: \n{expected}')
    print(f'\nX-squared = {chi2}')
    print(f'\nP - Valor = {p_Valor}')
    print(f'\ngl (f - 1)(c - 1) = {gl}')


def data_entry():
    data = []

    rows = int(input('Ingrese el número de filas: '))

    for i in range(rows):
        row_data = input(f'\nIngrese datos de la fila {i+1}:\n')
        row_data = row_data.split()
        row_data = [float(x) for x in row_data]

        data.append(row_data)
    
    return data

def instructions():
    print('''===BIENVENIDO A LA PRUEBA DE INDEPENDENCIA Y HOMOGENEIDAD===

Instrucciones:

    En cuanto al ingreso de datos: Primeramente debe ingresar
    número de filas de su data, luego tiene que ingresar los
    datos fila por fila.
    
    Ejm:
    
    My Data
               Columna_1   Columna_2
        Fila_1    15           9
        Fila_2    13          16
        Fila_3    20          12
    
    El programa le pedirá ingresar datos de la fila 1, 2, 3 hasta la
    fila enésima según su ingreso de número de filas.
    
    Usted deberá ingresar los datos de la fila pedida, separadas por 
    UN SOLO ESPACIO, una vez ingresado todos los datos de la fila
    presionar enter para continuar con el ingreso de las demaás
    hasta la enésima fila.

    Ejm:
    
    Ingrese datos de la fila 1:
        
        15 9
    
    Ingrese datos de la fila 2:
        
        13 16
    
    Ingrese datos de la fila 3:
        
        20 12
    
    Espero que estás instrucciones te hayan sido de ayuda, Gracias.
    
    Atte: Jhordan Sax
    
    Presione enter para continuar()...''')
    input()

if __name__=='__main__':
    run()