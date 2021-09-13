from scipy.stats import chisquare
from scipy.stats import binom

def run():
    print("===Prueba de Bondad de Ajuste===")
    print("""1. Distribucion uniforme
2. Distribucion Binomial
3. Distribucion Poisson
4. Calculo Probabilidad Normal""")

    op = int(input("\nIngrese opcion: "))

    datos = input("Ingrese fi separado por un solo espacio:\n")
    datos = datos.split()
    datos = [int(x) for x in datos]
    
    n_muestra = sum(datos)

    if op == 1:
        pi = Uniforme(datos)
    elif op == 2:
        pi = Binomial()
    elif op == 3:
        pi = Poisson(datos)
    elif op == 4:
        pi = Normal(datos)

    frec_espera = [x * n_muestra for x in pi]

    X_square, P_valor = chisquare(f_obs=datos, f_exp=frec_espera)
    print(f"\nLa suma de pi es: {sum(pi)}")
    print("\nFrecuencia esperada: ", frec_espera)
    print(f"\nX_square = {X_square}  P_Valor = {P_valor}")

def Uniforme(data):
    pass

def Binomial():
    n = int(input("Ingrese (n) : "))
    p = float(input("Ingrese (p) : "))

    binomia = [binom.pmf(x,n,p,loc=0) for x in range(n + 1)]
    
    return binomia
    
def Poisson(data):
    pass

def Normal(data):
    pass

if __name__=='__main__':
    run()