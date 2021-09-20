from scipy.stats import chisquare
from scipy.stats import binom
from scipy.stats import poisson
from scipy.stats import norm

##AUN SE NECESITA TRABAJAR PARA EL REESCALAMIENTO AUTOMÁTICO
def run():
    print("===Prueba de Bondad de Ajuste===")
    print("""1. Distribucion uniforme
2. Distribucion Binomial
3. Distribucion Poisson
4. Calculo Probabilidad Normal
5. Patron Establecido""")

    op = int(input("\nIngrese opcion: "))

    datos = input("\nIngrese fi separado por un solo espacio:\n")
    datos = datos.split()
    datos = [float(x) for x in datos]
    
    n_muestra = sum(datos)

    if op == 1:
        pi = Uniforme(datos)
    elif op == 2:
        pi = Binomial()
    elif op == 3:
        pi = Poisson(datos)
    elif op == 4:
        pi = Normal(datos)
    elif op == 5:
        pi = Establecido(datos)
    else:
        print('INGRESE UNA OPCION VALIDA')
        return False

    frec_espera = [x * n_muestra for x in pi]

    X_square, P_valor = chisquare(f_obs=datos, f_exp=frec_espera)
    print("\n===REPORTE DE DATOS===\n")
    print(f"Valores de pi:\n{pi}")
    print(f"\nLa suma de pi es: {sum(pi)}")
    print("\nFrecuencia esperada: ", frec_espera)
    print(f"\nX_square = {X_square}  P_Valor = {P_valor}")

def Uniforme(data):
    unifor = [1/len(data)] * len(data)

    return unifor

def Binomial():
    n = int(input("\nIngrese (n) : "))
    p = float(input("Ingrese (p) : "))

    binomia = [binom.pmf(x,n,p,loc=0) for x in range(n + 1)]
    
    return binomia
    
def Poisson(data):
    #solo por ahora se pide la media
    mu = int(input('\nIngrese media (mu): '))

    poiss = [poisson.pmf(x, mu, loc=0) for x in range(len(data))]

    #Debido a que la distribución de poisson va de 0 a INFINITO
    #Vamos a incluir el resto de la probabilidad en el caso n(ultima fila de datos que se tiene)
    restante = 1 - sum(poiss)

    poiss[-1] += restante

    return poiss

def Normal(data):
    #Aun no se aceptan percentiles solo Intervalos
    mu = float(input("\nIngrese mu : "))
    sigma = float(input("\nIngrese sigma: "))

    #Obteniendo y ajustando los intervalos
    intervalos = input("\nIngrese intervalos solo los limites superiores de cada intervalo separados por un espacio:\n")
    intervalos = intervalos.split()
    intervalos = [float(x) for x in intervalos]
    intervalos[-1] = intervalos[-2]

    dis_norm = []

    for index, value in enumerate(intervalos):

        #Se pueden dar 3 casos, el que va hacia el infinito, el que va al menos infinito y los intermedios
        if index == 0:
            dis_norm.append(norm.cdf(value, mu, sigma))
        elif index == (len(intervalos) - 1):
            dis_norm.append(1 - norm.cdf(value, mu, sigma))
        else:
            dis_norm.append(norm.cdf(value, mu, sigma) - norm.cdf(intervalos[index-1], mu, sigma))
    
    return dis_norm
    

def Establecido(data):
    print("\nRecuerda que la suma debe ser igual a 1..\n")
    patron = input('Ingrese patron de distribucion establecida separados por UN ESPACIO:\n')
    patron = patron.split()
    patron = [float(x) for x in patron]

    return patron

if __name__=='__main__':
    run()