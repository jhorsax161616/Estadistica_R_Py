            ##PLANTEAMIENTO DE HIPÓTESIS Y TIPO DE PRUEBA
##H0:µ>=    H1: µ<  Prueba de una cola a la izquierda
##H0:µ<=    H1: µ>  Prueba de una cola a la derecha
##H0:µ=     H1: µ<> Prueba de hipótesis de dos colas

##CASO: VARIANZA POBLACIONAL CONOCIDA
##Población sigue distribución normaly n>=2
##Población no es normal y n>=30

  ##Cálculo de Estadístico de prueba

n=
x=
Sigma=
mu=
z<-(x-mu)/(Sigma/sqrt(n))
z

  ## Cálulo de Valor p
Valorp<-pnorm(z)    ##cola izquierda
Valorp<-1-pnorm(z)  ##Cola Derecha
Valorp<-pnorm(z)*2  ##Dos colas
Valorp


##CASO: VARIANZA POBLACIONAL DESCONOCIDA (tengo la muestral)
##Población es normal y n<30

##Ingreso de datos
   ## DATOS RESUMIDOS
n=
x=
s=

  ## DATOS SUELTOS
data<-c(x1,x2,...)
n=
x<-mean(data)  ## calculo de ma media muestral
x
s<-sd(data)  ## calculo de desviación estándar muestral
s

  ##Cálculo de estadístico de prueba
mu=
t<-(x-mu)/(s/sqrt(n))
t

  ##Cálculo de valor-p
Valorp<-pt(t,n-1)        ##Una cola a la izquierda
Valorp<-1-pt(t,n-1)      ##Una cola a la derecha
Valorp<-(1-pt(t,n-1))*2  ##Dos colas
Valorp


