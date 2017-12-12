######################################################
# Introdução Linguagem R
# Raissa Oliveira
# prof Vitor Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################


#ATividade#
#####Usando o R como calculadora#####

#Digite no R os códigos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma os valores

# O símbolo # representa um comentário, isto é, tudo que vier à direita
# dele será ignorado quando o R ler o arquivo

34 - 72.3 #Subtração dos valores

# use pontos como separador de decimal. O que acontece se você usar virgula?
78 / 3 #Divisão do valor
2 ^ 3 #Potência
3 * 2 #Multiplicação de valores
sqrt(2) #Rais quadrada
pi #Valor de Pi
log(x = 3,base = 10) #Logaritimo
exp(x = 1) #Exponencial
#o que querem dizer estes valores dentro do parêntese? porque usamos o = aqui?
#O = atribui o valor ao elemento da esquerda.

#####Atribuição de valores e criação de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 #Cria um objeto 
objeto1 #Ver o elemento 3.
objeto = 42 #Cria um objeto
objeto #Ver o elemento 42
objeto.2 <- 42 #Cria o objeto.2
objeto.2#Ver o elemento 42.
# Os símbolos = e <- fazem basicamente a mesma coisa. Que coisa?
#Atribui um elemento ao objeto da esquerda
objeto.cubico <- objeto^3 #Potencia ao cubo do valor do objeto.
resultado.1 <- (objeto.cubico / 3) + 7  #Atribui ao resultado.1 o valor da divisão e soma de valores.
objeto.texto <- "texto sempre vem entre aspas" #Criou um objeto
objeto.texto #Chama o objeto
objeto.texto.2 <- "42" #Criou um objeto

objeto.vetor.1 = 1:34 #Criou um sequencia de 1 a 34
objeto.vetor.1 #Ver a sequencia de 1 a 34.
objeto.vetor2 = c(1, 74.5, 48) #Criou um objeto com os elementos da posição.
objeto.vetor2 #Mostra os elementos que estão na posição

?seq #Busca ajuda com a função
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) #Criou um objto de 20 até 30 com o intervalor de 0.5

#podemos calcular estatísticas com o r
mean(objeto.vetor3) #media #Media do valor do objeto anteriormente criado
var(objeto.vetor3) #variancia #
median(objeto.vetor3) #mediana #
min(objeto.vetor3)# Valor minimo do objeto criado anteriormemte.
max(objeto.vetor3)#Valor maximo do objeto criado anteriormente.
diff(objeto.vetor3) #calcula a diferenca entre os elementos sucessivos do vetor

# R tambem faz comparacoes entre objetos
42 > 7 #Verdadeiro, 42 é maior que 7
objeto == objeto.2 #O valor e exatamente igual 
objeto == objeto.texto.2 #O valor e extamente igual
# o que aconteceu acima? #Foi feito um teste para testar se os objetos sao exatamente iguais
7.1 <= 7.001 #Os valores não são iguais
?"<" #Help

#pedindo ajuda
?pi #Pedindo ajuda com pi
?log #Pedindo ajuda com o log
??lm #Pedindo ajuda e pacotes
help(log) #pedindo ajuda
help.search("anova") #Pedindo ajuda

#####Arquivos e diretórios#####
# Como você descobre o diretório de trabalho? setwd

# Como você lista o conteúdo do diretório de trabalho? ls()

# Como você define o diretório de trabalho? getwd

# Como você carrega um arquivo de script? load (file=endereço/ nome do arquivo)

# Como você salva os objetos que criou? save()ou save.image()

# Como você carrega os objetos que criou?

# Como ver quis objetos estão na sua área de trabalho?

# Como remover objetos da área de trabalho? 

##### Lidando com erros#####
# O que acontece quando você digita os comandos abaixo? Como consertar cada erro?
objetol #O objeto não é reconhecido
objeto.texto #O . e um simbolo inexperado
Objeto #O objeto não é reconhecido
source("chuchu.R") #Nenhum arquivo ou diretorio encontrado.
source(chuchu.R) #Objeto não encontrado
setwd("C:/CavernaDoDragão")
getwd #não é possivel mudar o diretorio de trabalho
Getwd() #Função não reconheceda
#dica: quando o R der erro, copie e cole a mensagem de erro no google


##FIM##