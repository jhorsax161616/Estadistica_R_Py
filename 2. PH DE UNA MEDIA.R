            ##PLANTEAMIENTO DE HIP�TESIS Y TIPO DE PRUEBA
##H0:�>=    H1: �<  Prueba de una cola a la izquierda
##H0:�<=    H1: �>  Prueba de una cola a la derecha
##H0:�=     H1: �<> Prueba de hip�tesis de dos colas

##CASO: VARIANZA POBLACIONAL CONOCIDA
##Poblaci�n sigue distribuci�n normaly n>=2
##Poblaci�n no es normal y n>=30

  ##C�lculo de Estad�stico de prueba

n=
x=
Sigma=
mu=
z<-(x-mu)/(Sigma/sqrt(n))
z

  ## C�lulo de Valor p
Valorp<-pnorm(z)    ##cola izquierda
Valorp<-1-pnorm(z)  ##Cola Derecha
Valorp<-pnorm(z)*2  ##Dos colas
Valorp


##CASO: VARIANZA POBLACIONAL DESCONOCIDA (tengo la muestral)
##Poblaci�n es normal y n<30

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
s<-sd(data)  ## calculo de desviaci�n est�ndar muestral
s

  ##C�lculo de estad�stico de prueba
mu=
t<-(x-mu)/(s/sqrt(n))
t

  ##C�lculo de valor-p
Valorp<-pt(t,n-1)        ##Una cola a la izquierda
Valorp<-1-pt(t,n-1)      ##Una cola a la derecha
Valorp<-(1-pt(t,n-1))*2  ##Dos colas
Valorp


