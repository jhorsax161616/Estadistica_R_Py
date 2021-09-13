## Prueba de Hip?tesis de una Proporci?n
     ##Planteamiento Hip?tesis: 
## H0: p>=   H1: p<    Prueba de una cola a la izquierda
## H0: p<=   H1: p>    Prueba de una cola a la derecha
## H0: p=    H1: p<>   Prueba de dos colas

    ## Estadistico de prueba
n=5000
x=15
p=0.002
pmuestral<-x/n
print(paste("p muestral = ", pmuestral))
z<-(pmuestral-p)/sqrt(p*(1-p)/n)
print(paste("El valor de Z =", z))

   ## Hallando el Valor p 
Valorp<-pnorm(z)    ##Una cola izquierda
Valorp<-1-pnorm(z)  ##Una cola Derecha
Valorp<-pnorm(z)*2  ##Dos colas
print(paste("El valor P = ", Valorp))
