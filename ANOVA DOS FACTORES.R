##Importar datos de excel
datos <- data.frame(SISTEMAS)
datos
xtabs(v ~ b + t, data=datos)
str(datos)


##Cálculo de medidas de resumen
tapply(datos$v,datos$t, summary)
tapply(datos$v,datos$b, summary)
aggregate(datos$v ~ datos$t, FUN = mean)
aggregate(datos$v ~ datos$t, FUN = sd)
aggregate(datos$v ~ datos$b, FUN = mean)
aggregate(datos$v ~ datos$b, FUN = sd)

##GRÁFICO DE CAJAS
boxplot(formula=v ~ t, data = datos, col="green")
boxplot(formula=v ~ b, data = datos, col="orange")


library(ggplot2)
library(gridExtra)
ggplot(data = datos, aes(x = t, y = v, col = b)) + geom_boxplot() + theme_bw()


## VERIFICACIÓN DE REQUISITOS
##PRUEBA DE NORMALIDAD

##Para n < 30
shapiro.test(datos$v[datos$t== "t1"])
shapiro.test(datos$v[datos$t== "t2"])
shapiro.test(datos$v[datos$t== "t3"])
shapiro.test(datos$v[datos$t== "t4"])
shapiro.test(datos$v[datos$t== "t5"])

shapiro.test(datos$v[datos$b== "b1"])
shapiro.test(datos$v[datos$b== "b2"])
shapiro.test(datos$v[datos$b== "b3"])
shapiro.test(datos$v[datos$b== "b4"])
shapiro.test(datos$v[datos$b== "b5"])  


##Prueba de K-S n >=30
library(nortest)
by(data = datos,INDICES = datos$t,FUN = function(x){ lillie.test(x$v)})
by(data = datos,INDICES = datos$b,FUN = function(x){ lillie.test(x$v)})

library(nortest)
lillie.test(datos$v[datos$b== "b1"])
lillie.test(datos$v[datos$t== "t2"])
lillie.test(datos$v[datos$t== "t3"])
lillie.test(datos$v[datos$t== "Outside"])


##PRUEBA DE HOMOGENEIDAD
bartlett.test(datos$v,datos$t)
bartlett.test(datos$v,datos$b)


##Hipótesis de Bloques y tratamientos
ANOVA <- aov(datos$v ~ datos$t + datos$b)   
summary(ANOVA)   

##Diferencias significativas por pares
##Diferencias entre tratamientos
boxplot(datos$v ~ datos$t,col="green")
TukeyHSD(ANOVA, "datos$t")

##Diferencias entre bloques
boxplot(datos$v ~ datos$b, col="orange")
TukeyHSD(ANOVA, "datos$b")

library(DescTools)
DunnettTest (x = datos$v, g= datos$t)
DunnettTest (x = datos$v, g= datos$b)



