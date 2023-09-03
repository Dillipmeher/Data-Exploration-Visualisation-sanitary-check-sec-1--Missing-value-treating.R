####------Introduction to R#########

# This is the symbol of Comment

# shift +Ctrl+c (For comment and de Comment)

print("Hellow world")
paste("Hellow","world",sep=">>>")
paste("hollow","world",sep="*******")
#____________________________________________________________________________

1+2+3+4+5
sum(1:5)
A<-1:100
A
#____________________________________________________________________
#class function is used to know which type of Data typ
class(A)
B<-"i love pizze"
class(B)
log1=TRUE
log1
class(log1)
comple1=10+5i
comple1
class(comple1)

#_________________________________________________________________________

#Assignment Operators
b=1
b<-1
1->b

#--------------------------------------------------------------------
#Arithmetic Operators
nom1=10
nom2=20
nom1+nom2
nom2-nom1
nom1*nom2
nom2/nom1

#----------------------------------------------------------
#Relational Operator
nom1>nom2
nom1<nom2
nom1==nom2
nom1!=nom2
#-----------------------------------------------
#Logical operators
log1=TRUE
log2=FALSE

log1&log1
log1&log2
log2&log2

log1|log1
log1|log2
log2|log1
log2|log2
#-------------------------------------------------
#Vectors- It is a list of Variable . A vector contains of a collection of numbers,arithmetic expression,logical value or character 
# c mean combine operator.(Homogeneous Data type,single dimensional data structure)
vec1 <- c(1,2,3)
vec2 <-c("a","b","c")
vec3 <-c(T,F,T)

mixvbag1 <- c(1,T,2,F)
mixvbag2 <- c(1,"a",2,"b")
mixvbag3 <- c(1,"a",T)

#1st precedent Character,2nd precedent number,3rd precedent logical
#----------------------------------------------------

#Extracting element from Vector
mixvbag2[1]
mixvbag2[2]
mixvbag2[1:3]
#----------------------------------
#List (Single Dimensional Heterogeneous Data structure) - Their individual value will be intact .
#E.g if i would store ,character value , logical value and Numeric value. 
#These value will not be changes. 
#It would be intact individually

l1<- list(1,"a",TRUE)
l1
class(l1[[1]])
class(l1[[2]])
class(l1[[3]])  

l2<-list(c(1,2,3),c("a","b","c"),c(T,F,T))
L2

# Extraction of individual element from the list
l2[[2]][2]
l2[[1]][3]
l2[[3]][1]
#------------------------------------
#Matrix - Two homogeneous data structure.  

m1 <- matrix(c(1,2,3,4,5,6))

m1<- matrix(c(1,2,3,4,5,6),nrow = 2,ncol=3)

m1<-matrix(c(1,2,3,4,5,6),nrow = 2,ncol = 3,byrow = TRUE)

#Extract
m1<-matrix(c(1,2,3,4,5,6),nrow = 2,ncol = 3,byrow = TRUE)
m1[2,2]
m1[1,2]
#--------------------------------------------------
#Array - Multi Dimensional Homogeneous data structure 
vec1<- c(1,2,3,4,5,6)
vec2<-c(7,8,9,10,11,12)

a1 <- array(c(vec1,vec2),dim = c(2,3,2))
# Extract
a1[1,3,2]
a1[1,3,1]

#---------------------------------------------------------
#Factor- 
#Factors are the data objects which are used to categorize the data and store it as levels. 
#They can store both strings and integers.

colour1<-c("blue","red","green")
as.factor(colour1)->colour1

-----------------------------------
#Data Frame 
# A data frame is a table or a two-dimensional array-like structure in which each column contains values of one variable and each row contains one set of values from each column
data.frame(fruit_name=c("Apple","Guava","Banana"),fruit_cost=c(10,15,20))-Fruits

fruits$fruit_name
fruits$fruit_cost

#-----------------------------
#inbuilt functions
data(package=.packages(all.available=TRUE))
view(iris)
str(iris)
head(iris)
tail(iris)

table(iris$Species)

mean(iris$Sepal.Length)
median(iris$Sepal.Length)
mode(iris$Sepal.Length)
min(iris$Sepal.Length)
max(iris$Sepal.Length)
range(iris$Sepal.Length)

#--------------------------------------------------------------
#if
if(iris$Sepal.Length[1]>4){print("sepal length is grater than 4")}
if(iris$Sepal.Length[1]<4){print("sepal length is less than 4")}

#if..else
if(iris$Sepal.Length[1]>4){print("sepal length is grater than 4")}else{print("sepal leng is less than 4")}

#---------------------------------------------------
#looping - For/while 
#we can repeat any task
#example putting water in the bucket by mug util and unless full

# for Loop
vec1<-(1:9)
for(i in vec1){print(i+5)}

#How to write in better way
vec1<-(1:9)
for(i in vec1){
  print(i+5)
}

# while loop
i = 1
while (i < 10) {
  print(i + 5)
  i = i + 1
}
#------------------------------------------------
# user define function
my_function(x)
add5<-function(x){return(x+5)}
#-------------------------------------
#Data Manipulation - Data Manipulation is the process of finding insights  by filtering, aggregating and summerizing the raw Data.
library(dplyr)
library(readxl)
LAPTOP<- read_excel("LAPTOP.xlsx")
View(LAPTOP)
LAPTOP<- read.csv("D:/data_set/LAPTOP.csv")
View(LAPTOP)

# Select Function use to filter the Column
LAPTOPS %>% select(1,2)->LAPTOPS1_2
View(LAPTOPS1_2)
LAPTOP %>% select(3:6)->LAPTOPS3_6
LAPTOP %>% select("Company","Product","Price")-> Laptop_Price
LAPTOP %>% select(starts_with("P"))-> Laptop_P
LAPTOP %>% select(ends_with("s"))-> LAPTOP_s

# Filter
LAPTOP %>% filter(Company=="Dell")-> Laptops_dell
View(Laptops_dell)  
LAPTOP %>% filter(Inches>15)-> Laptops_15_inches
LAPTOP %>% filter(Company=="Dell" & Inches>15)-> Dell_Laptops_15_inches

#Combining Select & Filter
LAPTOP %>% select("Company","Product","Price") %>% filter(Company=="Lenovo")-> Laptop_lenovo_4GB

#--------------------------------------
# library(ggplot2) - Grammer of Graphic
library(ggplot2)
View(diamonds)
?diamonds

#histogram
ggplot()
ggplot(data = diamonds)
ggplot(data = diamonds,aes(x=price))
ggplot(data = diamonds,aes(x=price))+geom_histogram()
ggplot(data = diamonds,aes(x=price))+geom_histogram(fill="Green")
ggplot(data = diamonds,aes(x=price))+geom_histogram(fill="Green",col="Orange")

# Bar plot
ggplot(data=diamonds,aes(x=cut))+geom_bar()
ggplot(data=diamonds,aes(x=cut))+geom_bar(fill="pale green")
ggplot(data=diamonds,aes(x=cut,fill=cut))+geom_bar()

# Scatter-Plot

ggplot(data=diamonds,aes(x=Carat,y=price))+geom_point()
ggplot(data=diamonds,aes(x=carat,y=price,col=cut))+geom_point()

# Box plot
ggplot(data=diamonds,aes(x=clariy,y=carat))+geom_boxplot()
ggplot(data=diamonds,aes(x=clarity,y=carat,fill=clarity))+geom_boxplot()

#faceting
ggplot(data=diamonds,aes(x=clarity,y=carat,fill=clarity))+geom_boxplot()+facet_grid(~cut)

-----------------------------------------------------
# Data Manipulation with Pokemon Data set
pokemon <- read.csv("D:/data_set/pokemon.csv")
View(pokemon)

# checking now of rows and columns in this data set
nrow(pokemon)
ncol(pokemon)

#tabulation of Historical columns
table(pokemon$is_legendary)
table(pokemon$generation)
table(pokemon$type1)

#min-max hp
min(pokemon$hp)
max(pokemon$hp)

min(pokemon$speed)
max(pokemon$speed)

#checking the missing value
is.na(pokemon$abilities)
sum(is.na(pokemon$abilities))

#Renaming Columns
colnames(pokemon)  #This will show all the columns of the data set
colnames(pokemon)=='type1' # this command show is there any column exist in the name of type1

colnames(pokemon)[colnames(pokemon)=='type1']<-"primary_type"
colnames(pokemon)[colnames(pokemon)=='type2']<-"secondary_type"
colnames(pokemon)[colnames(pokemon)=='names']<-"pokemon_name"
#-----------------------------------------------------
#filter & select function()  
# first download the library(dplyr)
library(dplyr)

pokemon %>% filter(primary_type=="grass")->grass_Pokemon
View(grass_Pokemon)
min(grass_Pokemon$speed) #10
max(grass_Pokemon$speed) #145
mean(grass_Pokemon$sp_attack)#74.32051
mean(grass_Pokemon$sp_defense) # 69.23077

# visualizing states of Grass-pokemon
library(ggplot2)
ggplot(data = pokemon,aes(x=hp))+geom_histogram()
ggplot(data = pokemon,aes(x=hp))+geom_histogram(fill='Pale green')
ggplot(data = pokemon,aes(x=hp))+geom_histogram(fill='pale green',col='red')

#height
ggplot(data = grass_Pokemon,aes(x=height_m))+geom_histogram()

#weight
ggplot(data=grass_Pokemon,aes(x=weight_kg))+geom_histogram()

#legendary vs not_legendary
ggplot(data=grass_Pokemon,aes(x=is_legendary))+geom_bar()

#-----------------------------------------------
# fire-pokemon
pokemon %>% filter(primary_type=="fire")->fire_Pokemon

min(fire_Pokemon$speed)# 20
max(fire_Pokemon$speed) # 126

mean(fire_Pokemon$sp_attack) 87.73077
mean(fire_Pokemon$sp_defense) 71.53846

# visualizing state of fire-pokemon

#generation
ggplot(data=fire_Pokemon,aes(x=generation))+geom_bar()
ggplot(data=fire_Pokemon,aes(x=generation,fill=as.factor(generation)))+geom_bar()
#as generation is digit type data so we used fill= as.faction(generation)

#secondary type
ggplot(data=fire_Pokemon,aes(x=secondary_type))+geom_bar()
ggplot(data=fire_Pokemon,aes(x=secondary_type,fill=secondary_type))+geom_bar()
#as secondary_type is categorical data so we used directly fill=secondary_type

#sp_attack vs Sp_defense
ggplot(data = fire_Pokemon,aes(x=sp_attack,y=sp_defense))+geom_point()
ggplot(data = fire_Pokemon,aes(x=sp_attack,y=sp_defense))+geom_point(col="coral")

#height vs weight
ggplot(data=fire_Pokemon,aes(x=height_m,y=weight_kg))+geom_point()

#-------------------------------------

# water_pokemon
pokemon %>% filter(pokemon$primary_type=="water")->water_pokemon

min(water_pokemon$speed) #5
max(water_pokemon$speed) #132

mean(water_pokemon$sp_attack) #74.0614
mean(water_pokemon$sp_defense) #71.79825

# visualising state of water Pokemon

#against ice
ggplot(data=water_pokemon,aes(x=against_ice))+geom_histogram()

#against poison
ggplot(data=water_pokemon,aes(x=against_poison))+geom_histogram()

#against grass
ggplot(data=water_pokemon,aes(x=against_grass))+geom_histogram()

#------------------------------------------

#psychic pokemon

pokemon %>% filter(pokemon$primary_type=="psychic")->psychic_pokemon
View(psychic_pokemon)

min(psychic_pokemon$speed) #20
max(psychic_pokemon$speed) #180

mean(psychic_pokemon$attack) #65.56604
mean(psychic_pokemon$defense) #69.26415

#visualising states of psychic pokemen

ggplot(data=psychic_pokemon,aes(x=base_total))+geom_histogram()

ggplot(data=psychic_pokemon,aes(x=base_total))+geom_histogram(fill='hot pink')

ggplot(data = psychic_pokemon,aes(x=as.factor(generation),y=sp_defense))+geom_boxplot()
ggplot(data = psychic_pokemon,aes(x=as.factor(generation),y=sp_defense))+geom_boxplot(fill='blue')
ggplot(data=psychic_pokemon,aes(x=is_legendary))+geom_bar()









