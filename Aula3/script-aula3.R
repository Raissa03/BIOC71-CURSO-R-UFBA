######################################################
# Introdu��o Linguagem R                          ####
# Raissa Oliveira                                 ####
# Universidade Federal da Bahia                   ####
#                                                 ####
######################################################

#diferencie a fun��o source da fun��o load() # A fun��o source executa todas as fun��es do script e o load carrega

#baixe para seu diret�rio de trabalho o arquivo toroidal.distance.R, dispon�vel
#em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R, e o arquivo distancias.csv, disponivel em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv

#Abra toroidal.distances.R no R
# O que voc� precisa fazer para que as fun��es contidas nesse arquivo estejam dispon�veis para uso no R?#Usar a fun��o source para isso � necessario ter o arquivo no formato correto.
# Fa�a o procedimento que voc� descreveu acima

#salvei o arquivo no meu diretorio de trabalho e utilizei o comando source("C:/Users/Raissa/Desktop/introdu��o ao R/toroidal.distance.R")

# Dentro do script toroidal.distance.R, altere o nome da fun��o toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo
write.csv(x= toroidal.distance,
          file = "distance.matrix.csv",
          sep = ",",
          dec = ".",
          row.names = F 
)

# Dentro do script toroidal.distance.R, altere o nome da fun��o toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo

# Carregue o arquivo distancias.csv para dentro do objeto distancias
# Carregue o arquivo distancias.csv para dentro do objeto distancias
distancias = read.csv("distancias.csv")


#chame a fun��o distance.matrix() com o objeto distancias, e o argumento tam = 100
source("toroidal.distance.R")

x=distance.matrix(distancias, tam=100)

# O que aconteceu?

#A fun��o da distancia.matrix executou utilizando os dados do objeto distancia.#

# O que voc� precisa fazer para que voc� possa usar a fun��o distance.matrix?
#Observar a estrutura da fun��o para utilizar-la corretamente.#


# Salve o resultado do comando acima com o nome de matriz.distancias.csv

write.csv(x, file="matriz.distancias.csv")

# Usando a linha de comando, importe o arquivo dragoes.xsls para o objeto DnD
#https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx (n�o abra o excel nem salve em .csv)


library(readxl)
library(readxl)
dragoes <- read_excel("C:/Users/Raissa/Desktop/Introdu��o ao R/dragoes.xlsx")

# Confira a estrutura do arquivo

# H� algum NA? houve algum problema com o cabe�alho?
#Sim, h� NA. N�o possui cabe�alho.

# Refa�a o script da aula 2, salvando o objeto caixeta, adicionando a coluna coletor e desvio, em um arquivo chamado caixeta_com_desvio.csv
caixeta
caixeta$coletor= "Darwin"
caixeta$desvio = caixeta$h - mean( caixeta$h)
caixeta=
write.csv(caixeta, file="caixeta_com_desvio.csv")
