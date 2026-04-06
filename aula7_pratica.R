dados = read.csv("dados-aula-7.csv")


# 1. Leitura do banco de dados
dados = read.csv("dados-aula-7.csv", header= TRUE, sep=",")

# ver estrutura
str(dados)
head(dados)

# 2. Identificando em que linhas do CSV houve problema de leitura

# ler linha por linha
linhas = readLines("dados-aula-7.csv") # quantidade de vírgulas em
#cada linha (não pode passar de 5 porque são 5 variáveis)
num_campos = sapply(strsplit(linhas, ","), length) # divide cada linha
#onde tem vírgula e conta quantos elementos tem
table(num_campos)

# exibir as linhas com problemas
which(num_campos != 5)
linhas[which(num_campos != 5)]


# 3. Leitura do banco de dados CSV corrigidos manualmente em
#relação aos separadores
dados = read.csv("dados-aula-7-corrigido.csv", header= TRUE, sep=",")

# ver estrutura
str(dados)
head(dados)

# 4. Padronizar as categorias da variável sexo
# colocar texto com letras minúsculas
dados$sexo = tolower(dados$sexo)

# remover espaços em branco antes e depois
dados$sexo = trimws(dados$sexo)


# recodificar

dados$sexo[dados$sexo %in% c("m", "masc", "masculino")] ="masculino"
dados$sexo[dados$sexo %in% c("f", "fem", "feminino")] = "feminino"

# transformar em fator
dados$sexo = as.factor(dados$sexo)
table(dados$sexo)

# 5. Ajustar variável idade (texto → número)
# ver valores distintos de idade
unique(dados$idade)

# corrigir textos
dados$idade[dados$idade == "vinte"] = 20
dados$idade[dados$idade == "vinte e dois"] = 22
dados$idade[dados$idade == "vinte e cinco"] = 25


# converter para numérico
dados$idade = as.numeric(dados$idade)
summary(dados$idade)

# 6. Tratar missing codificado de altura epeso
dados$altura[dados$altura == 999] = NA
summary(dados$altura)
dados$peso[dados$peso == 999] = NA
summary(dados$peso)

# 7. Extraindo missings no banco de dados
dados_limpos = na.omit(dados)
nrow(dados)
nrow(dados_limpos)

# 8. Exportando dados limpos
write.csv(dados_limpos, "dados-aula-7-limpos.csv", row.names = FALSE)
