######################################################
# Introdu��o Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#quando poss�vel, sua resposta deve ser um c�digo do R

#####Trabalhando com dados#####
# o que � um dataframe? Qual a diferne�a entre um dataframe e um list?

# o que as fun��es abaixo fazem? O que elas retornam?
is.vector() #� UMA VETOR? V OUF
is.numeric() # � UM NUMERO? V OU F
is.character()# � UM TEXTO?
is.matrix(peso) #� UMA MATRIZ
is.na() # OS VALORES S�O NA?
is.data.frame() # � UM DATA.FRAME?


#o que queremos dizer quando dizemos uma fun��o "retorna" alguma coisa?

#MOSTRA O RESULTADO 

#o que a fun��o summary() faz?
#Mostra o resumo dos resultados do objeto.

#Tr�s �reas foram submetidas aplica��o de tr�s adubos diferentes, e uma foi
#mantida como controle. A biomassa seca (kg) por parcela foi medida para
#verificar se houve efeito do adubo. Os dados obtidos foram:

#(Controle)	A	37	34	36	42	31  33
#B	62	54	57	64	60
#C	63	58	60	62	61 44
#D	41	37	38	49	35 49
#Crie um dataframe com estes dados

tratamento = c (rep("A",6), rep("B",5), rep("C",6), rep("D",6))
Peso = c (37,	34,	36,	42,	31,  33, 62,	54,	57,	64,	60, 63,	58,	60,	62,	61, 44, 41,	37,	38,	49,	35, 49)

adubo = data.frame(tratamento, Peso)
media.a = mean(adubo$Peso [adubo$tratamento == "A"])

#Calcule a m�dia de cada tipo de adubo, sem usar summary(), usando o dataframe
#que voc� criou acima

#que problemas voc� teve ao fazer o exerc�cio acima?


# O que a fun��o unique() faz?
# mOSTRA TUDO O QUE OCORRE IGNORANDO AS REPETI��ES

#Usando o conjunto de dados caixeta.csv, disponivel em
#http://ecologia.ib.usp.br/bie5782/doku.php?id=dados:dados-caixeta, calcule
#quantas esp�cies est�o presentes na coluna especie. Para ler o arquivo, execute
#o c�digo abaixo
caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
# o arquivo deve estar no seu diret�rio de trabalho
str(caixeta) #o que este comando faz? #mOSTRA A ESTRUTRA INTERNA DO BJETO
summary(caixeta) #rESUMO ESTATISTICA TUDO MISTURADO 

#podemos criar uma coluna a mais no nosso dataframe apenas dizendo ao R o que
#colocar l�. Por exemplo, criamos uma coluna com o nome do coletor do dado
caixeta$coletor= "Darwin" #regra da reciclagem
str(caixeta)

caixeta$desvio = caixeta$h - mean( caixeta$h)
#agora adicione no objeto caixeta uma coluna chamada "desvio" com o quanto a
#altura de cada �rvore difere da m�dia de todas as �rvores

#Usando a fun��o table(), conte quantos indiv�duos de cada esp�cie existem
table(caixeta$especie)
#A fun��o table() tamb�m pode contar por esp�cie em cada local, depois por local
#em cada esp�cie). Como?
table (caixeta$especie,caixeta$local)

#crie um objeto chamado pequenas que contenha todas as �rvores com altura (h)
#menor que um metro.(Os dados no arquivo est�o em cent�metros)

pequenas = caixeta [caixeta$h < 100,]
#crie um objeto chamado grandes que contenha todas as �rvores acima de 3 metros
grandes = caixeta [caixeta$h > 300,]
#crie um objeto chamado medias que todas as �rvores com alturas entre um metro e
#tres metros
medias = caixeta [caixeta$h >= 100 & caixeta$h<=300,]
#agora em uma linha de comando, crie um objeto que contenha a quantidade de
#�rvores pequenas, m�dias e grandes, separadamente
todas = c(length(pequenas$local), length(medias$local), length(grandes$local))
todas
dim(pequenas)
#Crie um objeto chamado obj somente com os individuos de "Alchornea
#triplinervia" Em quantas localidades esta esp�cie ocorre? Qual comando para
#encontrar essa informa��o?
obj= caixeta[caixeta$especie == "Alchornea triplinervia",]
table(obj$local) #contando quantas ocorrencias em obj em local dealchornea triplinervia
unique(obj$local)

#podemos remover dados de um dataframe, usando o sinal de menos

caixeta.sem.tabebuia = caixeta[ - which(caixeta$especie=="Tabebuia cassinoides"),]
sort(unique(caixeta.sem.tabebuia$especie)) #unique me cita as especies e sort � uma fun��o que ordena

#agora crie um objeto removendo todas as "Tabebuia cassinoides" do local retiro
#(somente do local retiro) #(! � nao. n�o pegue o que cumpre as condi��es a seguir)

caixeta.sem.retiro = caixeta[ ! (caixeta$local == "retiro" & caixeta$especie == "Tabebuia cassinoides"),]
                                
#crie os objetos abaixo, junte eles num dataframe de duas colunas chamado comNA,
#depois crie um novo objeto chamado semNA, removendo todas as linhas que
#contenham NA, usando a nota��o acima (dica: s� se usa "" para valores do tipo
#character)
id = 1:80
a = c(121.72355, 103.79754, 130.15442, 98.29305, 103.43365, 102.44998,
      NA, 111.07215, 113.74047, 103.16081, 80.87149, 98.66692,
      65.09549, 155.74965, 88.30168, 147.43610, 114.60806, 109.87433,
      149.54772, 83.54137
)
b = c(77.91352, 78.07251, 81.95604, 75.64862, 78.45213, 79.11058,
      79.98952, 79.18127, 840.1635, 74.86860, 82.01886, 78.26936,
      77.94691, 78.75372, 77.64901, NA, 77.19803, 72.48175,
      83.45336, 78.99681
)
c = c(127.9366, 201.7158, NA, 136.5880, 131.7213, 118.1486,
      125.7534, 139.6544, 163.5890, 139.7455, NA, 141.4450, 110.7311,
      157.5921, 176.8437, 102.8659, 121.8286, 134.7097, 157.1392, 166.7133
)
d = c(191.3721, 216.1671, 165.4380, 196.2730, 172.6565, 178.2955,
      193.6687, NA, 160.2968, 208.4400, 204.0934, 208.1798,
      186.6380, 193.9446, NA, 198.6853, 213.8838, 210.1881,
      209.9109, 210.9228
)

comNA=data.frame(id,c(a,b,c,d))
 semNA =comNA[!is.na(comNA$c.a..b..c..d.),] #is.NA MOSTRA COM true onde est�o o na
semNA 
semNA2 = na.omit(comNA) #na.omit retira o na do banco de dados

machos = c(120,107,110,116,114,111,113,117,114,112)
femeas= c(110,111,107,108,110,105,107,106,111,111)
chacais= data.frame(machos, femeas) #dataframe
media.m =mean(machos)
media.f= mean(femeas)
media.sp = mean(c(machos,femeas))
machos.grandes = machos[machos> media.f]
machos.grandes
machos.grandes = chacais$machos[chacais$machos > media.f] #Usando dataframe
machos.grandes

#escreva **uma** linha de c�digo que testa se um n�mero � par, e caso seja,
#manda uma mensagem dizendo "par". dica: use a fun��o %% (resto da divis�o, ou
#remainder em ingl�s) e a fun��o message()

#agora crie um c�digo  como acima, mas que diga "par" se for par e "impar" se
#for impar. Dica: leia sobre as fun��es else e ifelse
if(8%%2 ==0){message("par")}
if(5%%2 == 0){message("par")}
if(x>4*mean(dados)){dados[-x]}
if(9%%2 == 0){message("par")} else {message("impar")}
#if se isso por isso fa�a isso, else se n�o for fa�a aquilo

#crie um ciclo (for) que mostre o console todos os inteiros de 1 at� 10, um por
#um
for (i in 1:10){
  message(i)
}
#crie um ciclo (for) que some todos os inteiros de 25 at� 43, guardando esses
#valores num objeto soma (dica: crie o objeto soma com valor zero antes do
#c�digo do ciclo)
soma= 0

for (i in 25:43){
  soma=soma+i
  message(soma)
}



#####Desafio level Hard#####
#Escreva um c�digo que escreva os n�meros de um a 100, com as seguintes
#condi��es: Se o n�mero for multiplo de 3, ao inv�s do d�gito, escreva "Fu". Se
#o n�mero for m�ltiplo de 5, ao inv�s do d�gito, escreva "b�". Para n�meros que
#forem multiplos tanto de 3 quanto de 5, escreva "Fub�". A melhor solu��o ganha
#um chocolate