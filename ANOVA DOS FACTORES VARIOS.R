##Importar datos de excel
datos <- data.frame(FARMACO)
datos
str (datos) 
class(datos$v)

datos$t <- factor(datos$t)
datos$b <- factor(datos$b)
str (datos) 

##GRÁFICO DE CAJAS
library(ggplot2)
library(gridExtra)
p1 <- ggplot(data = datos, aes(x = b, y = v)) + 
  geom_boxplot() + theme_bw()
p2 <- ggplot(data = datos, aes(x = t, y = v)) +
  geom_boxplot() + theme_bw()
grid.arrange(p1, p2, ncol = 2)

p3 <- ggplot(data = datos, aes(x = templado, y = resistencia, colour = grosor)) +
  geom_boxplot() + theme_bw()
p3

##MEDIDAS DESCRIPTIVAS TRATAMIENTOS
with(data = datos,expr = tapply(v, t, mean))
with(data = datos,expr = tapply(v, t, sd))

##MEDIDAS DESRIPTIVAS BLOQUES
with(data = datos,expr = tapply(v, b, mean))
with(data = datos,expr = tapply(v, b, sd))

##MEDIDAS DESCRIPTIVAS POR GRUPO
with(data = datos,expr = tapply(v, list(b,t), mean))
with(data = datos,expr = tapply(v, list(b,t), sd))


##PRUEBA DE INTERACCION
interaction.plot(datos$b, datos$t, datos$v, data = datos, col = 2:3, type = "b")

ggplot(data = datos, aes(x = t, y = v, colour = b,group = b)) +
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun = mean, geom = "line") +
  labs(y  =  'mean (v)') +
  theme_bw()


ggplot(data = datos, aes(x = b, y = v, colour = t,
                         group = t)) +
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun = mean, geom = "line") +
  labs(y  =  'mean (v)') +
  theme_bw()

##PRUEBA ANOVA
anova <- aov(v ~ t * b, data = datos)
summary(anova)


##Diferencias significativas por pares
##Diferencias entre tratamientos
boxplot(datos$v ~ datos$t,col="green")
TukeyHSD(anova, "t")

##Diferencias entre bloques
boxplot(datos$v ~ datos$b, col="orange")
TukeyHSD(anova, "b")
