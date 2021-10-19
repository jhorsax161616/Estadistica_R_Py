list.of.packages <- c("plot3D", "rsq", "heplots", "caret", "MASS", "leaps", "car", "relaimpo", "hier.part") 
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


##Ingreso de datos
##Digitando
y<-c()
x1<-c()
x2<-c()
x3<-c()
x4<-c()
datos<-data.frame(y,x1,x2,x3,x4)
datos
datos


##Desde Excel
datos<-as.data.frame(DATOS_1)
datos

library(dplyr)

##Revisión de datos
head(datos)     
dim(datos)
View(datos)
fix(datos)
str(datos)

#Analisis de correlación
round(cor(x=datos),4) # Matriz de correlación Bivariadas
library(GGally)
##Matriz de correlaciones
ggpairs(datos,lower = list(continuous="smooth"),
        diag=list(continuous = "barDiag"),axisLabels="none")

library(ggplot2)
ggplot(datos,aes(x1,y))+
  geom_point(color="blue")+geom_smooth(method=lm,color="red",se=FALSE)

##Generación del modelo
modelo<-lm(y ~ x1+x2+x3+x4,data=datos)
summary(modelo)


##Pronóstico Puntual
estim <-data.frame(x1=c(75),x2=c(24),x3=c(90),x4=c(98))
predict(modelo,newdata = estim)

