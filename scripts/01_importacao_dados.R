### importacao de planilhas ###

#carregar pacotes necessarios
library(readr)
library(dplyr)

#importar dados "," como separador de colunas e "." como separador decimal
p_csv <- read_csv("data_raw/parcelas.csv",
                  na = c("", "NA", "N/A", "-9999"))

#importar dados ";" como separador de colunas e "," como separador decimal
p_br  <- read_csv2("data_raw/parcelas_br.csv",
                   na = c("", "NA", "N/A", "-9999"))

# essas informacoes na planilha -> "", "NA", "N/A", "-9999" significam "na"


#planilhas possuem mesma quantidade de linhas
nrow(p_csv) == nrow(p_br)

#mostra tipos numéricos adequados (sem texto misto)
glimpse (p_csv)
glimpse (p_br)
