######################################################
# Introdução Linguagem R                          ####
# Raissa Oliveira                                 ####
# Universidade Federal da Bahia                   ####
#                                                 ####
######################################################

#diferencie a função source da função load() # A função source executa todas as funções do script e o load carrega

#baixe para seu diretório de trabalho o arquivo toroidal.distance.R, disponível
#em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R, e o arquivo distancias.csv, disponivel em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv

#Abra toroidal.distances.R no R
# O que você precisa fazer para que as funções contidas nesse arquivo estejam disponíveis para uso no R?#Usar a função source para isso é necessario ter o arquivo no formato correto.
# Faça o procedimento que você descreveu acima

#salvei o arquivo no meu diretorio de trabalho e utilizei o comando source("C:/Users/Raissa/Desktop/introdução ao R/toroidal.distance.R")

# Dentro do script toroidal.distance.R, altere o nome da função toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo
write.csv(x= toroidal.distance,
          file = "distance.matrix.csv",
          sep = ",",
          dec = ".",
          row.names = F 
)

# Dentro do script toroidal.distance.R, altere o nome da função toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo

# Carregue o arquivo distancias.csv para dentro do objeto distancias
# Carregue o arquivo distancias.csv para dentro do objeto distancias
distancias = read.csv("distancias.csv")


#chame a função distance.matrix() com o objeto distancias, e o argumento tam = 100
source("toroidal.distance.R")

x=distance.matrix(distancias, tam=100)

# O que aconteceu?

#A função da distancia.matrix executou utilizando os dados do objeto distancia.#

# O que você precisa fazer para que você possa usar a função distance.matrix?
#Observar a estrutura da função para utilizar-la corretamente.#


# Salve o resultado do comando acima com o nome de matriz.distancias.csv

write.csv(x, file="matriz.distancias.csv")

# Usando a linha de comando, importe o arquivo dragoes.xsls para o objeto DnD
#https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx (não abra o excel nem salve em .csv)


library(readxl)
library(readxl)
dragoes <- read_excel("C:/Users/Raissa/Desktop/Introdução ao R/dragoes.xlsx")

# Confira a estrutura do arquivo

# Há algum NA? houve algum problema com o cabeçalho?
#Sim, há NA. Não possui cabeçalho.

# Refaça o script da aula 2, salvando o objeto caixeta, adicionando a coluna coletor e desvio, em um arquivo chamado caixeta_com_desvio.csv
caixeta
caixeta$coletor= "Darwin"
caixeta$desvio = caixeta$h - mean( caixeta$h)
caixeta=
write.csv(caixeta, file="caixeta_com_desvio.csv")
