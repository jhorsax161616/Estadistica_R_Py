##INGRESO DE DATOS
x <- c(20,60,100,140,180,220,260,300,340,380)
y <- c(0.18,0.37,0.35,0.78,0.56,0.75,1.18,1.36,1.17,1.65)

data2 <- data.frame(y, x)
data2

##MODELO DE REGRESIÓN
modelo <- lm(y ~ x, data = data2)
modelo
summary(modelo)



##Intervalo de confianza de los coeficientes
confint(modelo)

##Prueba de ajuste del modelo - Tabla ANOVA
anova(modelo)

##VERIFICACIÓN DE SUPUESTOS
library(ggplot2)
par(mfrow=c(2,2))
plot(modelo)


##Gráfico Residuales Vs Ajustados
pred<-predict(modelo)
qplot(x=pred,y=rstandard(modelo),
      main="Residuales Estandarizados vs Valores Ajsutados",
      geom=c("point"),ylab="Residuales Estandarizados",
      xlab="Valores Ajustdos")+
  geom_hline(yintercept = 0,color =2)

##Gráfico normal Q-Q
ggplot(as.data.frame(residuals(modelo)),
       aes(sample = residuals(modelo)))+
        geom_qq()+ stat_qq_line(col="red")
  
##Pronóstico Puntual
estim <-data.frame(x=c(300))
predict(modelo,newdata = estim)

## Intervalo de confianza ( valor promedio y estimado)
predict(modelo,newdata=estim,interval="confidence",level = 0.95)

## Intervalo de predicción
predict(modelo,newdata=estim,interval="prediction",level = 0.95)





## https://rpubs.com/osoramirez/316691