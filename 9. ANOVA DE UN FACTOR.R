##ANOVA DE UN FACTOR

##LEER ARCHIVOS EN EXCEL
datos <- data.frame(ARCHIVO)
datos

## MEDIDAS DE RESUMEN
table(datos$t)
aggregate(v ~ t, data = datos, FUN = mean) #media por cada grupo
aggregate(v ~ t, data = datos, FUN = sd) #desviacion estandar por cada grupo

##GRÁFICO DE CAJAS
library(ggplot2)
ggplot(data = datos, aes(x = t, y = v, color = t)) +
  geom_boxplot() +
  theme_bw()

## VERIFICACIÓN DE REQUISITOS
##PRUEBA DE NORMALIDAD de Shapiro (n <= 25)
shapiro.test(datos$v[datos$t== "t1"])
shapiro.test(datos$v[datos$t== "t2"])
shapiro.test(datos$v[datos$t== "t3"])
shapiro.test(datos$v[datos$t== "t4"])
shapiro.test(datos$v[datos$t== "t5"])

##PRUEBA DE NORMALIDAD DE KOLMOGOROV-SMIRNOV (n > 30)
require(nortest)
by(data = datos,INDICES = datos$t,FUN = function(x){ lillie.test(x$v)})


##PRUEBA DE HOMOGENEIDAD
bartlett.test(datos$v,datos$t)

##ANÁLISIS ANOVA
ANOVA1 <- aov( v ~ t,data = datos )
summary(ANOVA1) # para ver los resultados del anova
plot(ANOVA1)


##PRUEBA POST HOC

#Prueba TUCKEY
TukeyHSD(ANOVA1)
plot(TukeyHSD(ANOVA1))

#Prueba de BONFERRONI
pairwise.t.test( datos$v, datos$t, p.adj = "bonferroni")





##https://www.youtube.com/watch?v=3wbuVNKGkxg
##https://rpubs.com/Joaquin_AR/218466
##https://rpubs.com/icaro/411288
##https://rpubs.com/Jo_/ANOVAs
##https://www.youtube.com/watch?v=4q_mfYZV7-8