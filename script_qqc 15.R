
#library(readxl)
#datos <- read_excel("D:/OneDrive\ -\ continental.edu.pe/Uni_C/SEMESTRE_IV/Estadistica_Aplicada/Unidad_4/datoscontrol.xlsx", 
#                           range = "B1:F23")

## LEER DATOS DE EXCEL
datos<-data.frame(datoscontrol)
datos

# grafico de rachas
library(qcc)
rachas <- qcc(data = datos,type ="xbar.one",
              data.name="rachas para satisfaccion") # POR DEFECTO HALLA 3SIGMAS
rachas <- qcc(data = datos,type ="xbar.one",
              data.name="rachas para satisfaccion",
              nsigmas = 3)

# grafico de control por variables
# R_prom - R
rango <- qcc(data = datos,type ="R",
              data.name=" R_prom - R:para satisfaccion",
              nsigmas = 3)
rango$center
rango$limits
rango$violations

# X_prom - Sigma
xprom <- qcc(data = datos,type ="xbar",
             data.name=" x_prom-sigma:para satisfaccion",
             nsigmas = 3)
xprom$center
xprom$limits
xprom$violations

# grafico para variable cualitativa
# grafico de control de atributos
# grafico p
library(readxl)
datos2 <- read_excel("datoscontrol.xlsx", 
                           sheet = "Hoja2")
View(datos2)
# grafico de proporciones
grafp <- qcc(data = datos2,type ="p",
             data.name=" grafico p:para satisfaccion",sizes =50)
grafp$center
grafp$limits
grafp$violations



