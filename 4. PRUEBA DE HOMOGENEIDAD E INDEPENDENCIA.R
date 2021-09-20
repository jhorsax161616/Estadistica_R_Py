##Ingreso de la tabla de contingencia
Tabla1 <- as.table(rbind(c(12,14), c(18,23),c(6,14)))
Tabla1
##prueba
chisq.test(Tabla1)$expected
chisq.test(Tabla1)
chisq.test(Tabla1)$statistic
