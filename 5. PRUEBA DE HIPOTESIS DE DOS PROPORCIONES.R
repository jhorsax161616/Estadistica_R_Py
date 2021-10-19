##PRUEBA DE HIP�TESIS DE DOS PROPORCIONES
##H0:p1=p2  ##p1-p2=0  p1 y p2 son proporciones poblacionales
##H1:p1<>p2  ##Prueba de dos colas
##H1:p1<p2  ##Prueba una cola a la izquierda
##H1:p1>p2  ##Prueba una cola a la derecha
x1=   #Númeto de exitos de la muestra 1
  n1=
  pm1<-x1/n1   ##proporci�n muestral 1
pm1
x2=
  n2=
  pm2<-x2/n2   ##proporci�n muestral 2
pm2
pm<-(x1+x2)/(n1+n2)  ##proporci�n muestral ponderada p-rayipa P_
pm
dif=0
z<-((pm1-pm2)-dif)/sqrt(pm*(1-pm)/n1+pm*(1-pm)/n2)
z

valorp<-pnorm(z)*2  ##Prueba de dos colas
valorp<-(1-pnorm(z))*2  ##Prueba de dos colas si Z es positivo
valorp<-pnorm(z)##H1:p1<p2  ##Prueba una cola a la izquierda
valorp<-(1-pnorm(z)) ##H1:p1>p2  ##Prueba una cola a la derecha
valorp