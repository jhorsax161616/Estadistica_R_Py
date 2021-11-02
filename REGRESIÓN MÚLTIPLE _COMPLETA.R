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
datos<-as.data.frame(X50_Startups)
datos
#Eliminar variables cualitativas
datos$Variable <- NULL
datos

library(dplyr)

##Revisi?n de datos
head(datos)     
dim(datos)
View(datos)
fix(datos)
str(datos)

#Analisis de correlaci?n
round(cor(x=datos),4) # Matriz de correlaci?n Bivariadas
library(GGally)
##Matriz de correlaciones
ggpairs(datos,lower = list(continuous="smooth"),
        diag=list(continuous = "barDiag"),axisLabels="none")

library(ggplot2)
ggplot(datos,aes(x1,y))+
  geom_point(color="blue")+geom_smooth(method=lm,color="red",se=FALSE)

##Generaci?n del modelo
modelo<-lm(y ~ x1+x2+x3+x4,data=datos)
summary(modelo)

##Selecci?n de los mejores variables predictores
step(object = modelo, direction = "both", trace = 1)
##en base al criterio de informaci?n de Akaike (AIC)

library(MASS)

##Modelo regresi?n por pasos
step.model<-stepAIC(modelo,direction="backward",trace=FALSE)
##resultado final
summary(step.model)

##Intervalo de confianza para los coeficientes
confint(lm(formula =  y ~ x1+x2+x3,data=datos))

##Validaci?n de condiciones del modelo

##Relaci?n lineal entre los predictores num?ricos y variables respuesta:
library(ggplot2)
library(gridExtra)
plot1<-ggplot(data=datos,aes(x1,step.model$residuals))+
  geom_point()+geom_smooth(color="firebrick")+geom_hline(yintercept = 0)+
  theme_bw()
plot2<-ggplot(data=datos,aes(x2,step.model$residuals))+
  geom_point()+geom_smooth(color="firebrick")+geom_hline(yintercept = 0)+
  theme_bw()
plot3<-ggplot(data=datos,aes(x3,step.model$residuals))+
  geom_point()+geom_smooth(color="firebrick")+geom_hline(yintercept = 0)+
  theme_bw()
grid.arrange(plot1,plot2,plot3)


##Normalidad de los residuos (falta mejorar)
qqnorm(step.model$residuals)
qqline(step.model$residuals)

shapiro.test(step.model$residuals)  ## n<30
library(nortest)
lillie.test(step.model$residuals)   ## n >= 30


##Variabilidad constante de los residuos (Homocedasticidad)
library(ggplot2)
ggplot(data=datos,aes(step.model$fitted.values,step.model$residuals))+
  geom_point()+
  geom_smooth(color="firebrick",se=FALSE)+
  geom_hline(yintercept = 0)+
  theme_bw()
library(lmtest)
bptest(step.model)

##No multicolinealidad
library(corrplot)
corrplot(cor(dplyr::select(datos, x1,x2,x3)),
         method="number",tl.col="black")

##An?lisis de inflaci?n de varianza (VIF)
library(car)
vif(step.model)

##Identificaci?n de posibles valores at?picos e influyentes
library(dplyr)
library(ggplot2)

datos$studentized_residual<-rstudent(step.model)
ggplot(data=datos,aes(x=predict(step.model),y=abs(studentized_residual)))+
  geom_hline(yintercept = 3,color="grey",linetype="dashed")+
  geom_point(aes(color=ifelse(abs(studentized_residual)>3,'red','black')))+
  scale_color_identity()+
  labs(title="Distribuci?n de los residuos studentized",
       x="Predicci?n step.model")+
  theme_bw()+theme(plot.title = element_text(hjust=0.5))

##Valores influyentes
summary(influence.measures(step.model))

##Laverages (hat): Se consideran valores influyentes aquellos 
##cuyos valores hat superen 2.5((p+1)/n), siendo p el n?mero de predictores
## y n el n?mero de observaciones.
##Distancia Cook(cook.d): Se consideran influyentes valores superiores a 1.
influencePlot(step.model)

##Pron?stico Puntual
estim <-data.frame(x1=c(75),x2=c(24),x3=c(90))
predict(step.model,newdata = estim)


