#i) Leitura e manipulação dos dados limpos

#ii) analise descritivacom distribuição de frequências e gráficos 

#iii) análise descritiva com medidasdescritivas.


# Script da aula 7 - 06/04 para praticar uso de branches no Git e GitHub


# 1. Leitura e manipulação dos dados
dados = read.csv("dados-aula-7-limpos.csv", header=TRUE, sep = ",")
# ver estrutura
str(dados)
head(dados)

# cálculo de IMC
dados$imc = dados$peso / ((dados$altura/100)^2)

# criando faixas etárias
dados$faixa_etaria = ifelse(dados$idade < 30, "Jovem",
                            ifelse(dados$idade < 60, "Adulto", "Idoso"))
dados$faixa_etaria = factor(dados$faixa_etaria)


# 2. Distribuição de frequências e gráficos

# 2. Distribuição de frequências e gráficos
table(dados$sexo)
barplot(table(dados$faixa_etaria, dados$sexo), beside = TRUE, legend
        = TRUE)
hist(dados$altura)
boxplot(dados$imc ~ dados$sexo)

# use comandos para distribuição de frequências de sexo, gráfico de
#colunas para faixa_etaria por sexo, histograma de altura, boxplot de
#IMC por sexo

# 3. Medidas descritivas

# 3. Medidas descritivas
minimo_idade = min(dados$idade)
maximo_idade = max(dados$idade)
mediana_idade = median(dados$idade)
media_idade = mean(dados$idade)
desvio_idade = sd(dados$idade)

minimo_peso = min(dados$peso)
maximo_peso = max(dados$peso)
mediana_peso = median(dados$peso)
media_peso = mean(dados$peso)
desvio_peso = sd(dados$peso)

minimo_altura = min(dados$altura)
maximo_altura = max(dados$altura)
mediana_altura = median(dados$altura)
media_altura = mean(dados$altura)
desvio_altura = sd(dados$altura)




# use comandos de cálculo de mínimo, máximo, média, mediana e
#desvio-padrão para idade, altura, peso e IMC
