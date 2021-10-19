##  H0:Sigma^2=   H1:Sigma^2<>  Prueba de dos colas
##  H0:Sigma^2<=   H1:Sigma^2> Prueba de cola a la derecha
##  H0:Sigma^2>=36     H1:Sigma^2<36  Prueba de cola a la izquierda

###Para Datos sueltos
datos<-c(x1,x2,..,xn)
s2=sd(datos) ##Varianza muestral
s2
###Datos resumidos
##Tenga cuidado con confundir varianza con desviación estandar
n=
  s2=     ##Varianza muestral
  sigma2=     ##varianza poblacional tomada de H0
  x2<-(n-1)*s2/sigma2
x2
Valorp<-1-pchisq(x2,n-1) #Cola a la derecha
Valorp<-(1-pchisq(x2,n-1))*2  ##Dos colas
Valorp<-pchisq(x2,n-1) ## Cola a la izquierda
Valorp


##Calculo de Valor cr�tico con chi o ji cuadrado
n=
  Alfa =
  punto_cri<-qchisq(Alfa,n-1)
punto_cri