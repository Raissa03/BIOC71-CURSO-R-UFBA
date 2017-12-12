##############################################
##      Introducao ao R                     ##
##      Raissa de Oliveira                  ##
##     exercicios 1,2,3 - 06/12             ##
##############################################


####Conferindo Data Frames####
aves.c <- read.csv2("aves_cerrado.csv", row.names=1, as.is=T) #lendo o arquivo
head(aves.c) #ver os dados das primeiras linhas do data frame
tail(aves.c)# ver os dados das linhas finais do fata frame

str(aves.c)
summary(aves.c) #mostra os principais resultados geral (como media) do data frame.

is.na(aves.c)# mostra a existencia de NA em todo data frame
is.na(aves.c$urubu)# mostra a existencia de NA naa coluna urubu
aves.c[is.na(aves.c$urubu),] #mostra linha onde o NA aparece na coluna urubu
aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),]#mostra as linhas onde o NA aparece em todas as colunas listadas.
temp1 <- aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),] #guardando o resultado anterior em um objeto.
aves.c$urubu[is.na(aves.c$urubu)] <- 0 #substituindo o NA por 0
aves.c$carcara[is.na(aves.c$carcara)] <- 0# #substituindo o NA por 0
aves.c$seriema[is.na(aves.c$seriema)] <- 0 ##substituindo o NA por 0
aves.c[aves.c$urubu==0|aves.c$carcara==0|aves.c$seriema==0,] #ver todas as linhas das colunas listadas onde o 0 aparece
temp1 #ver o objeto.
table(aves.c$fisionomia) #verificar os valores da coluna que será um fator
aves.c$fisionomia[aves.c$fisionomia =="ce"] <- "Ce" #corringindo um erro de digitacao
table(aves.c$fisionomia) #mostrar 
aves.c$fisionomia <- factor(aves.c$fisionomia, levels=c("CL","CC","Ce"))
summary(aves.c) #verificando novamente

####Média, Mediana e Quantis####

mean(aves.c[,2:4]) #comando não funciona mais nesta versao
sapply(aves.c[,2:4],mean)#gera a media das 3 colunas com numeros
sapply(aves.c[,2:4],median)##gera a mediana das 3 colunas com numeros

apply(aves.c[,2:4], 2, mean, trim=0.1) #media truncada

quantile(aves.c$urubu) ## O mesmo que o retornado pelo summary
summary(aves.c$urubu)
quantile(aves.c$urubu, probs= seq(from=0,to=1,by=0.1))

summary(aves.c[,2:4]) #ver todos os dados de media, media, quantis


####Exploração de uma Variável Categórica####

caixeta <- read.csv("caixeta.csv", as.is=T)  #Ler o arquivo
names(caixeta)#ver as variaveis do objeto
table(caixeta$especie)# ver a coluna especies do objeto caixeta.
x11()
barplot(table(caixeta$local)) #plotar um grafico de barras com a coluna local.

####Gráficos para uma Variável####

par(mfrow=c(2,2)) #Função coloca os graficos a seguir em 2 colunas e 2 linhas
x11()
boxplot(aves.c$urubu)#grafico
hist(aves.c$urubu)#grafico
plot(density(aves.c$urubu))#grafico
stripchart(aves.c$urubu, method="stack")grafico
par(mfrow=c(1,1))

####Variações do Histograma####

## Histograma com os valores (funcao rug)
hist(aves.c$urubu)#grafico
rug(aves.c$urubu)#erro
rug(jitter(aves.c$urubu))#grafico

hist(aves.c$urubu, prob=T)#plota o histograma
lines( density(aves.c$urubu),col="blue" ) #plota uma linha azul que segue o pico do histograma
 
hist(aves.c$urubu, prob=T)
curve(expr = dnorm(x,mean=mean(aves.c$urubu),sd=sd(aves.c$urubu)),add=T, col="red")      # aplica uma linha de normalidde ao grafico
plot(density(aves.c$urubu),col="blue", ylim=c(0,0.08))# CVurva de diversidade que posteriormente será sobreposta a de normalidade
curve(expr = dnorm(x,mean=mean(aves.c$urubu),sd=sd(aves.c$urubu)),add=T, col="red") #curva de normalidade plota em cima do anterior

####table e aggregate####

table(caixeta$especie,caixeta$local)
caixeta.alt <- aggregate(caixeta$h, by=list(local=caixeta$local,especie=caixeta$especie),
                         FUN=mean)
####xtabs####

####xtabs####

Titanic.df <- read.csv("titanic.csv", as.is=T) #Carrega o objeto Titanic.df com arquivo Titanic.csv
Titanic.df 
xtabs(Freq~Sex+Survived, data=Titanic.df) #Cria uma tabela de contigência, nesse caso Freq~Sex+Survived
?xtab
prop.table(xtabs(Freq~Sex+Survived, data=Titanic.df), margin=1) #Resultado da tabela de contigência em proporção.
?prop.table
xtabs(Freq~Class+Survived, data=Titanic.df) #Cria uma tabela de contigência, nesse caso Freq~Class+Survived
prop.table(xtabs(Freq~Class+Survived, data=Titanic.df), margin=1) #Resultado da tabela de contigência em proporção.

table(Titanic.df$Sex,Titanic.df$Survived)

####Fórmula Estatística em Gráficos####
boxplot(urubu~fisionomia, data=aves.c) #Boxplot da coluna urubu em função da fisionomia.
plot(seriema~urubu, data=aves.c, subset=fisionomia=="Ce") #Plot da variável seriema em função de urubu

plot(seriema~urubu, data=aves.c, subset=fisionomia=="CC") #Plot da variável seriema em função de urubu, quando a fisionomia for CC.
plot(seriema~urubu, data=aves.c, subset=fisionomia!="CL") #Plot da variável seriema em função de urubu, quando a fisionomia for CL.


library(lattice)
?lattice
xyplot(seriema~urubu|fisionomia, data= aves.c) #Plota a variavel seriema em função de urubu, sob a condicionante fisionomia.


####O quarteto de Anscombe####
data(anscombe)#carrega para a area de trabalho
ls() #agora o objeto está no workspace

names(anscombe) ##carrega para a area de trabalho

apply(anscombe[1:4], MARGIN=2, FUN=mean) #Cálculo da média
apply(anscombe[5:8], 2, mean) #Cálculo da média

apply(anscombe[1:4], 2, var)   #Cálculo da variância
apply(anscombe[5:8], 2, var) #Cálculo da variância

with(anscombe,cor(x1,y1)) #Testa a relação entre as variáveis.
with(anscombe,cor(x2,y2)) #Testa a relação entre as variáveis.
with(anscombe,cor(x3,y3)) #Testa a relação entre as variáveis.
with(anscombe,cor(x4,y4)) #Testa a relação entre as variáveis.

par(mfrow=c(2,2)) # 4 graficos em uma janela
plot(y1~x1, data=anscombe) #Plota Y1 em função de X1
plot(y2~x2, data=anscombe) #Plota Y2 em função de X2
plot(y3~x3, data=anscombe) #Plota Y3 em função de X3
plot(y4~x4, data=anscombe) #Plota Y4 em função de X4
par(mfrow=c(1,1)) #

par(mfrow=c(2,2)) # 4 graficos em uma janela
plot(y1~x1, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y1~x1, data=anscombe))
plot(y2~x2, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y2~x2, data=anscombe))
plot(y3~x3, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y3~x3, data=anscombe))
plot(y4~x4, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y4~x4, data=anscombe))
par(mfrow=c(1,1))

#### Cervejas####

cervejas <-c("chope","lata","garrafa","chope","garrafa", "garrafa","lata","lata","nenhuma","lata","garrafa","garrafa", "garrafa","lata","lata","lata","garrafa","lata","chope","nenhuma", "garrafa","garrafa","garrafa","chope","garrafa","garrafa","chope","garrafa","lata","lata") #cria o objeto cervejas
summary(cervejas)
tabela <- table(cervejas)# cria o objeto
tabela
x11()
cerveja = barplot(tabela)# grafico em barras por tipo de bebida
cervejadotplot = dotchart(as.vector(tabela), labels = c("chope", "garrafa", "lata", "nenhuma"))#Grafico em pontos
      

####Caixetais####
caixeta = read.csv("caixeta.csv", sep= "," , dec=".")
str(tabcaixetas)
x11()
hist(caixeta$fuste)# histograma do fruste
hist(caixeta$h[caixeta$local=="chauas"])# histograma do local chauas
hist(caixeta$h[caixeta$local=="retiro"])# histograma do local retiro
hist(caixeta$h[caixeta$local=="jureia"])# histograma do local jureia

####Eucaliptos####

eucalipt = read.table("eucalipto.php.csv", header=TRUE, sep=";", as.is=TRUE) #abrir o arquivo no r
eucalipt

boxplot(eucalipt$dap~eucalipt$regiao)# Bloxplot  da variavel dap em funcao da regiao
boxplot(eucalipt$dap~eucalipt$rotacao)#Bloxplot da variavel dap em funcao da rotacao
par(mfrow=c(2,2))# abrir 2 linhas e 2 colunas de graficos na mesma janela
barplot(eucalipt$ht)#Plotar graficos em barras da variavel ht
hist(eeucalipt$ht)#plotar histograma da variavel ht
qqnorm(eucalipt$ht)#plotar a normalidade para comparar.
qqline(eucalipt$ht)#plotar linha de normalidade para comparar.

####Mais Caixetais####
x11()
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"]) # grafico da relacao de dap e h somente para a especie Tabebuia cassinoides no local chauas
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"])# grafico da relacao de dap e h somente para a especie Tabebuia cassinoides no local retiro
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"])# grafico da relacao de dap e h somente para a especie Tabebuia cassinoides no local jureia

scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"])#verificando a linearidade da funcao
scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"])# verificando a lineaaridade da funcao
scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"])# verificando a linearidaade da funcao
