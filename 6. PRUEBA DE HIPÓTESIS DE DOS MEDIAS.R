##PRUEBA DE HIP?TESIS DE DOS MEDIAS
##MUESTRAS INDEPENDIENTES
##LAS VARIANZA POBLACIONALES CONOCIDAS
##Tambi?n cuando las variables no son normales y n1 y n2 n>=30
##con datos de resumen
##H0: mu1>=mu2   H1: mu1<mu2 pRUEBA DE UNA COLA A LA IZQUIERDA
##H0: mu1<=mu2   H1: mu1>mu2 pRUEBA DE UNA COLA A LA DERECHA
##H0: mu1=mu2   H1: mu1<>mu2 pRUEBA DE DOS COLA
n1=           ##Tama?o de muestra 1
prom1=      ##promedio de muestra 1
sigma21=   ##Varianza de poblaci?n 1
n2=           ##Tama?o de muestra 2
prom2=      #promedio de muestra 2
sigma22=     ##Varianza poblacional 2

## ESTAD?STICO DE PRUEBA  
dif=0
z=((prom1-prom2)-dif)/sqrt(sigma21/n1+sigma22/n2)
z
valorp<-pnorm(z)  # Cola a la izquierda
valorp<-1-pnorm(z)  # Cola a la derecha
valorp<-pnorm(z)*2  # dos colas si z es negativo
valorp<-(1-pnorm(z))*2  # dos colas si z es positivo
valorp



##PRUEBA DE HIP?TESIS DE DOS MEDIAS
##MUESTRAS INDENDIENTES
####LAS VARIANZA POBLACIONALES DESCONOCIDAS
##(SE TIENE O CALCULA VARIANZAS MUESTRALES)

##CON DATOS SUELTOS
##Ingresar valores de x1 x2
x1<-c(X1.x2...)
x2<-c()

##Prueba de Hip?tesis de varianzas
##H0:sigma1=sigma2   H1: sigma1<>sigma2
var.test(x1,x2)  ## verificar que F=s21/s22>1

##Prueba de dos medias, Cuando las varianzas son iguales
##H0: mu1=mu2   H1:mu1<>mu2  ##Prueba de dos colas
t.test(x1,x2,alternative = "two.side",paired = FALSE,var.equal = TRUE)
##Prueba de una cola a la izquierda (<)  alternative = "less"
##Prueba de una cola a la derecha (>)  alternative = "greater"


##Prueba de dos medias, Cuando las varianzas diferentes
##H0: mu1=mu2   H1:mu1<>mu2   Prueba de dos colas
##H0: mu1<=mu2   H1:mu1>mu2   Prueba de una cola a la derecha
##H0: mu1>=mu2   H1:mu1<mu2   Prueba de una cola a la izquierda
t.test(x1,x2,alternative = "two.side",paired = FALSE,var.equal = FALSE)
##Prueba de una cola a la izquierda (<)  alternative = "less"
##Prueba de una cola a la derecha (>)  alternative = "greater"

##PRUEBA DE HIP?TESIS DE DOS MEDIAS
##MUESTRAS INDEPENDIENTES
####LAS VARIANZA POBLACIONALES DESCONOCIDAS
##(SE TIENE O CALCULA VARIANZAS MUESTRALES)
##con datos de resumen
n1=
prom1=
s21=   ##Varianza muestral 1
n2=
prom2=
s22=     ##Varianza muestral 2
##Prueba de dos varianzas poblacionales
##H0:sigma21=sigma22      H1:sigma21<>sigma22
F<-s21/s22   ##Estad?stico de Prueba  
F             ##s21/s22 > 1
valorp<-(1-df(F,(n1-1),(n2-1)))*2
valorp

##Prueba de medias, cuando varianzas diferentes
dif=0
t=((prom1-prom2)-dif)/sqrt(s21/n1+s22/n2)
t
A<-s21/n1
B<-s22/n2
gl=((A+B)^2)/(A^2/(n1-1)+B^2/(n2-1))
gl
valorp<-pt(t,gl)
valorp


##Prueba de medias, cuando las varianzas son iguales
dif=0
sp2<-((n1-1)*s21+(n2-1)*s22)/(n1+n2-2)
sp2
t=((prom1-prom2)-dif)/sqrt(sp2/n1+sp2/n2)
t
gl=n1+n2-2
gl
valorp<-1-pt(t,gl) ##Prueba de una cola a la derceha
valorp<-pt(t,gl) ##Prueba de una cola a la izquierda

valorp<-pt(t,gl)*2 ##Prueba de dos cola si z es negativo
valorp<-(1-pt(t,gl))*2 ##Prueba de dos cola si z es positivo
valorp


##PRUEBA DE HIP?TESIS DE DOS MEDIAS
##MUESTRAS PAREADAS
##Ingresar X1 Y X1
x1<-c(1903,1935,1910,2496,2108,1961,2060,1444,1612,1316,1511)
X2<-c(2009,1915,2011,2463,2180,1925,2122,1482,1542,1443,1535)
##Prueba de dos medias, muestras pareadas
##H0: mud=0   H1:mud<>0
t.test(x1,X2,alternative = "two.side",paired = TRUE) ##"two.side"(=) or "less"(<) or "greater"(>)
