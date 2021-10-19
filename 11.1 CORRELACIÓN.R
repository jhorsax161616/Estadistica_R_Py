##INGRESO DE DATOS
x <- c(20,60,100,140,180,220,260,300,340,380)
y <- c(0.18,0.37,0.35,0.78,0.56,0.75,1.18,1.36,1.17,1.65)

##GR?FICO DE DISPERSI?N 
pairs(x ~ y)  #permite elaborar un plot de correlacion

##Otra forma de hacerlo de una forma elegante
library(PerformanceAnalytics)
# Nuestros datos es mejor tenerlos en un data.frame
dat1 <- data.frame(x, y)
dat1
chart.Correlation(dat1)

library(ggplot2)
ggplot(dat1,aes(x,y))+
  geom_point(color="blue")+geom_smooth(method=lm,color="red",se=FALSE)

##Prueba de normalidad de variables
shapiro.test(x) ##n<=25
shapiro.test(y)

##C?LCULO DE CORRELACI?N
##cor sirve para analizar correlaciones tipo matriz
cor(x, y)  ##Por defecto es Pearson
#cor.test analiza la significancia de la correlacion, utilizando el contraste t-student.
cor.test(y, x)   ## Correlaci?n de Pearson y de dos colas
cor.test(y,x,method = "pearson",alternative="greater",conf.level = 0.95)  
cor.test(y, x)$statistic
cor.test()


##si es otro m?todo agregar  method = "spearman" o "kendall"
## si es prueba de una cola agregar alternative="two.sided", "less" o "greater" 
