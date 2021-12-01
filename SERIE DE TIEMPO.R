##Instalar las siguientes librerias
attach(ST_TURISTAS)
names(ST_TURISTAS)
library(xts)
library(tidyverse)
library(lubridate)
library(tseries)
library(astsa)
library(forecast)
library(foreign)
library(timsac)
library(vars)
library(mFilter)
library(dynlm)

##Ingresar la serie de tiempo
turistas.ts<-ts(ST_TURISTAS, start=c(2013,1),end=c(2019,12), frequency=12)
print(turistas.ts)
start(turistas.ts);end(turistas.ts)
cycle(turistas.ts) 
class(turistas.ts)##Identifica que es una serie de tiempo

##Gráfico de la serie de tiempo
boxplot((turistas.ts)~ cycle(turistas.ts)) ##Gráfico de cajas
plot(turistas.ts,ylab="turistas", main="cantidad de turistas extranjeros")

##Modelo aditivo
modeloaditivo=decompose(turistas.ts)
plot(modeloaditivo)


##Modelo multiplicativo
modelomultiplicativo=decompose(turistas.ts,type="mult")
plot(modelomultiplicativo)

##Para estimar tendencia (promedio movil centrado)
tendencia=modelomultiplicativo$trend ##Cambiar a modeloaditivo si es q lo es
print(tendencia)

##Estimar la Estacionalidad
estacionalidad=modelomultiplicativo$seasonal ##Cambiar a modeloaditivo si es q lo es
print(estacionalidad)
ndiffs(turistas.ts) ##Identifica el número de diferencias a realizar

##Gráfica conjunta de tendencia y estacionalidad
ts.plot(cbind(tendencia,tendencia*estacionalidad),lty=1:2)


##ANÁLISIS DE ESTACIONALIDAD
seasonplot(turistas.ts,col=rainbow(12),year.labels = TRUE)

##Función de autocorrelación -> No tiene que haber autocorrelacion o sea (#difera pqa == 0)
acf(turistas.ts)
ndiffs(turistas.ts) ##Numero de diferencias para quitar autocorrelacion

##Cuando no es estacionaria
seriedif=diff(turistas.ts)
plot(seriedif)
acf(seriedif)
ndiffs(seriedif) ##Identifica el número de diferencias a realizar

##Análisis visual del autocorrelaicón
par(mfrow=c(2,2),mar=c(4,4,4,1) +.1)
plot(turistas.ts,ylab="Turistas")
acf(turistas.ts,main="Serie no estacionaria")
plot(seriedif)
acf(seriedif,main="Serie estacionaria")
seriedif

#data2 <- data.frame(y, x)
#data2

##MODELO DE Tendencia
##Desde Excel
datos<-as.data.frame(ST_TURISTAS2)
datos

##Gráfico de tendencia
library(ggplot2)
ggplot(ST_TURISTAS2,aes(Periodo,VDES))+
  geom_point(color="blue")+geom_smooth(method=lm,color="red",se=FALSE)

##Modelo de Tendencia
modelo<-lm(VDES ~ Periodo,data=ST_TURISTAS2)
summary(modelo)


##Pronóstico Puntual
estim <-data.frame(Periodo=c(84))
T<-predict(modelo,newdata = estim)
T
##Pronóstico 
##Modelo aditivo
IE=
Y = T + IE

##Modelo multiplicativo
IE=1.0326361
Y=T* IE

Y
