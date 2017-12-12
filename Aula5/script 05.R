#######################################
##            Introdução ao R        ##
##          AULA 4- 05/12/2017       ##
##         Raissa de Oliveira        ##
#######################################

Cartesiana - plot(x,y) #Plota gráficos

Formula - plot(y~x) #Plota gráficos

riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45) #Dados
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85) #Dados
area.cate <- rep(c("pequeno", "grande"), each=6)

x11() # Abre o gráfico em uma nova janela 
plot(riqueza~area) #Plota um gráfico de relação entre a riqueza e a area
plot(area,riqueza) # o mesmo que o anterior
boxplot(riqueza~area.cate) #Plota um grafico com varoles da riqueza e da area cate com desvio padrao
barplot(riqueza) # Plota um grafico de barras.

obj1= read.csv("esaligna.csv", sep= ",", dec= "." ) #ler o arquivo.


x11() #Plota o grafico em uma nova janela
plot(x= obj1$dap, y=obj1$ht) #Plota em um grafico a relacao do dap e ht 
plot(x= obj1$ht, y=obj1$tronco)#plota em um grafico a relacao do ht com o tronco.
plot(x= obj1$dap, y= obj1$classe)#plota em um grafico a relacao do dap e da classe.
plot(x=obj1$dap, y=obj1$talhao)#Plota em um grafico a relacao entre os valores de dap e talhao.
plot(obj1$dap)#Plotou em um grafico os valores apenas de dap
plot(obj1$ht)#plotou em um grafico apenas os valores de ht


x11()

boxplot(obj1$dap , obj1$ht, col= "red") #plota o bloxplot das variaveis dap e ht, na cor vermelha e a mediana em preto.
boxplot(obj1$ht, obj1$tronco, col= "red")#plota o bloxplot das variaveis ht e tronco, na cor vermelha e a mediana em preto.
boxplot(obj1$dap, obj1$classe, col="red")#plota o bloxplot das variaveis dap e classe(plotagem incorreta pois ña variavel classe nao contem valores)na cor vermelha e a mediana em preto.
boxplot(obj1$dap, obj1$talhao, col="red")#plota o bloxplot das variaveis dap e talhao, na cor vermelha e a mediana em preto.
boxplot(obj1$dap, col="red") #plota o bloxplot das variaveis dap, na cor vermelha e a mediana em preto.
boxplot(obj1$ht, col="red")#plota o bloxplot das variaveis ht, na cor vermelha e a mediana em preto.

x11()
barplot(obj1$dap, obj1$ht)#Há erro na plotagem do gráfico, apenas a primeira variavel é plotada. O barplot só utiliza uma variavel por vez.
barplot(obj1$ht, obj1$tronco)# Mesmo erro anterior
barplot(obj1$dap, obj1$classe) #Há erro pois a coluna classe não se trata de valores.
barplot(obj1$dap, obj1$talhao )#Mesmo erro do 1 e 2 item.
barplot(obj1$dap)#Há a plotagem das barras dos valores de dap.
barplot(obj1$ht)#Há a plotagem das barras dos valores de ht.

riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)

par(las=2, family="serif") #par determina caracteristicas que serao empregadas em todos os grafigos a seguir.
x11()
plot(area, riqueza, xlab= "Tamanho da Ilha (ha)", ylab= "Riqueza de Espécies", main= "Aves das Ilhas Samoa") #os comandos estão plotando um grafico com a relacao das variaves area e riqueza, depois, o eixo x e y serao renomeados, e por fim esta sendo acrescentado um titulo ao grafico.

riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
area.cate <- rep(c("pequeno", "grande"), each=6)
x11()
plot(riqueza~area) #grafico da relacao riqueza/area
plot(riqueza~area, bty="l", tcl=0.3)#grafico da relacao riqueza/area, com a caixa em forma de L sem a superiror e lateral direita.
boxplot(riqueza~area.cate, bty="l", tcl=0.3)# boxplot da riquezaa e area.cate, com a caixa em forma de L
par(bty="l")# todos os graficos a seguir terao essa configuracao
par(tcl=0.3)#todos os graficos a seguir terao essa configuracao
x11()
boxplot(riqueza~area.cate) #novamente o mesmo boxplot anterior.
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
abundancia <- rev(riqueza)

plot(riqueza~area)# plotando o grafico da relcao riqueza/area
lines(lowess(area, riqueza))#tracando uma linha na correlacao positiva
model <-  lm(riqueza~area)# criação de um modelo de linha (totalmente reta) para posterior plot.
plot(riqueza~area)#plot
abline(model)#aplicacao da linha.

plot(riqueza~area) #plot do grafico
abline(v=mean(area))#inserir uma linha reta na vertical
abline(h=mean(riqueza)) #inserir uma linha reta na horizontal.

plot(riqueza~area)
text(20,40,"texto") # insere um texto no ponto das coordenadas dadas.

plot(riqueza~area)
mtext("legenda no lado errado", side=4, line=0.9, at=20,cex=2, family="serif") # acrescenta um texto nas margens do grafico, com tamanho e tipo de letras controladas e o tamanho dos pontos.

par(mfrow=c()) #cria graficos lado a lado.

plot(riqueza~area)
par(new=TRUE) #Essa função permite que o grafico anterior seja sobreposto pelo posterior.
plot(abundancia~area)

x11()
plot(riqueza~area)
par(new=TRUE)
plot(abundancia~area, axes=FALSE, ann=FALSE, pch=16) #plota o novo grafico a sobrepor o anterior, pch é utilizado aqui para modificar o ponto do segundo grafico com a funcao de diferencia-los
axis(4) #acrescenta o novo eixo.

arrows() # insere barras ou flexas do grafico
rect() #insere outras formas no grafico

plot(riqueza~area)
rect(20,20,40,40)
jpeg(filename = "Algumnome.jpg") # salva o grafico anterior no formado jpg



x11()
plot(obj1$dap, obj1$ht, xlab= "DAP", ylab="HT", bty= "l", main= "Gráfico de dispersão", cex.lab=1.5, cex.axis = 2, cex.main= 3 ) #grafico de dispersao com os nomes dos eixos modificados, com o titulo adicionado e com o tamanho das letras modificados

boxplot(obj1$dap,obj1$talhao, col="pink", main="Gráfico A") #Boxplot do dap e talhao com o titulo.

mean (obj1$dap)

obj2= read.csv("exercicio3.csv", sep= ",", dec= "." ) #leitura do arquivo
plot(obj2$x1, obj2$y1, xlab="Log(Patch size)(ha)", ylab="Euclidean distances", pch=17) #grafico das variaveis x1 e y1,mudança no nome dos eixos, e modificação no tipo de ponto

lines(lowess(obj2$x1,obj2$y1))# linha de correlaçao entro a variavel x1 e y1.
model <-  lm(obj2$x1~obj2$y1) #criação do modelo de linhas reta
plot(obj2$x1,obj2$y1)
abline(model) #aplicando o modelo de linha ao grafico

