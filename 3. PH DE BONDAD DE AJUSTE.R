##Crear vector de Observados
o<-c(x1,x2,x3,...,xk)

##Crear vector de probabilidades
## Cuando la distribuci?n es un uniforme o patr?n establecido
pi<-c(p1,p2,p3,...,pk)
pi

## Cuando la distribuci?n en Binomial
pi<-dbinom(0:n,n,p=)
pi

## Cuando la distribuci?n es Poisson
pi<-dpois(0:xn,p)
pi


##C?lculo de probabilidad Normal
mu=       ##Calcular la media si no dan
sigma=      ##Calcular la desviacion estandar si no dan
p1<-pnorm(x1,mean=mu, sd=sigma) ##Probabilidad menor que
p2<-pnorm(x2,mean=mu, sd=sigma)-pnorm(x1,mean=mu, sd=sigma) ##Probabilidad entre dos valores
pk<-1-pnorm(xk,mean=mu, sd=sigma)  ##Probabilidad mayor que
pi<-c(p1,p2,p3,p4,...pk)


##Comprobar que suma de probabilidades es 1
sum_pi<-sum(pi)  
sum_pi


##C?lculo de la prueba
## Probar que menos del 20% de los Ei son menores de 5
chisq.test(o,p=pi,rescale.p=T)$expected ##Muestra los valores esperados
chisq.test(o,p=pi,rescale.p=T)

## Si m?s del 20% de las Ei son menores 5 se deben juntar a clases vecinas
## Reclacular el vector de valores observados oi
## Recalcular el vector de probabilidades pi
## Comprobar que suma de probabilidades es 1
## C?lculo de la prueba
