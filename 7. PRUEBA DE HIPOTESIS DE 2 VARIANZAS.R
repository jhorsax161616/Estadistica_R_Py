##PRUEBA DE HIP�TESIS DE DOS VARIANZA
##H0:sigma21=sigma22      H1:sigma21<>sigma22
##H0:sigma21>=sigma22      H1:sigma21<sigma22
##H0:sigma21<=sigma22      H1:sigma21>sigma22

## Datos resumidos
s21=    ##Varianza muestral 1
  n1=
  s22=  ##Varianza muestral 2
  n2=
  
  ## Estad�stico 
  F<-s21/s22   ##Estad�stico de Prueba  
F             ##s21/s22 > 1

valorp<-df(F,(n1-1),(n2-1))
valorp

##Datos sueltos
G1<-c(6.15,5.63,5.58,6.91,4.63,5.53,5.03,5.45,5.03,6.09)
G2<-c(4.96,5.04,4.75,4.61,4.47,5.02,5.35,3.6,5.26,5.41,5.42)
media1<-mean(G1)
media1
dev_est1<-sd(G1)
dev_est1
media2<-mean(G2)
media2
dev_est2<-sd(G2)
dev_est2
var.test(G1,G2) #Prueba de sos colas
var.test(G1,G2,alternative = "greater")
var.test(G1,G2,alternative = "less")