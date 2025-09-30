### limpeza e padronizacao de conteudos ###

#carregar pacotes necessarios
library(dplyr)
library(stringr)
library(lubridate)

#criando objeto com dados, padronizando nomes, tipos e conteudos
dados <- p_csv %>%
  mutate(
    especie  = str_squish(str_to_sentence(especie)),
    data     = ymd(data),                # "yyyy/mm/dd"
    area_m2  = as.double(area_m2)
  )
dados

#nomes das especies com primeira letra maiuscula, espacos entre palavras
#coluna data no formato ano/mes/dia
#coluna area_m2 como numerico


#lidar com NA, códigos sentinela e padronizar tratamentos
dados <- dados %>%
  mutate(
    tratamento = recode(str_to_lower(trimws(tratamento)),
                        "controle" = "controle",
                        "control"  = "controle",
                        "impacto"  = "impacto",
                        "tratado"  = "impacto",
                        .default = tratamento)
  ) %>%
  distinct() %>% #remove linhas duplicadas
  tidyr::drop_na(area_m2) %>% #remove "na" da coluna area_m2
  mutate(densidade = n_individuos / area_m2) #cria uma coluna de densidade
