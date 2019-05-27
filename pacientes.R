# Cargo el dataset
pacientes <- read.csv("~/pacientes/pacientes.csv", sep=",")
fechas <- as.Date(pacientes$fecha, "%d-%m-%Y")
pacientes_nombre <- pacientes$paciente
drogas <- pacientes$droga
# Poné una fecha...
fecha <-as.Date("25-12-2017",format="%d-%m-%Y")

result <- data.frame(paciente=c(), fecha=c(), droga=c())
daux <- c()
pac_ant <- ""
i = 0
for(row in 1:nrow(pacientes)) {
  if (pac_ant != pacientes_nombre[row]) {
    pac_ant <- pacientes_nombre[row]
    daux <- c()
  }
  
  # El temita acá es tener en cuenta los años bisiestos... 
  if (difftime(fechas[row], fecha) < 366) {
    #print(pacientes_nombre[row])
    #print(fechas[row])
    #print(drogas[row])
    if (c(drogas[row]) %in% daux) {
      print("pasó")
      result$paciente[i] <- pacientes_nombre[row]
      result$fechas[i] <- fechas[row]
      result$drogas[i] <- drogas[row]
      i = i + 1
    } else {
      daux <- append(daux, c(drogas[row]))
    }
  }
}

write.csv(result, "~/pacientes/resultado.csv")