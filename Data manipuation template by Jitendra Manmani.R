# Setting the working directory 
# - to have access to all files in the folder to be called in R
# - setwd() fn sets up a link/ connection to the path on your local system

setwd("D:\\Jigsaw Unext Training\\R\\Batch 16")

getwd()
#Reading/ Importing the oj csv file into R
# Create a dataframe oj
oj <- read.csv("oj.csv", header = TRUE, stringsAsFactors = TRUE)


# what is the defalut value for header?? Try header = FALSE and without header
# do we need stringsAsfactors = False?

# View the data frame created in R

View(oj)

# Check data structure - data types etc. - use str command
# Do we need to type cast feat variable? Make changes as needed

str(oj)

# we have to change the feat data type to factor from int

# Check dimension of the data (# rows and columns) - us dim, nrow and ncol

v<-dim(oj)

v[1]

dim(oj)[1]

# can you find out % of weeks when feat (promo) was running
sum(oj$feat)/dim(oj)[1]

oj$feat

dim(oj)[1]

dim(oj)[2]

# Checking top and bottom records of the data- head and tail


head(oj)

tail(oj)

# Check Variable names in the  - names fn

names(oj)

# View - to view the df
# dim - to get row/ col counts
# str - to look at summarized view of data (data types)
# head/ tail - to look at top 6 and bottom 6 records
# names - to look at the var names

# what is a missing values?
# NA >> data was not captured


sum(is.na(oj$feat))
sum(is.na(oj$price))





colSums(is.na(oj))

# Checking count of missing values for each of the columns - colSums

sum(is.na(oj))

colSums(is.na(oj))

#dataframe[rows,columns] indexer
#Get the data element in first row and 3rd column
oj[1,3]

# Get 1,3,6 columns for row numbers 1,2,8,456
oj[c(1,2,8,456),c(1,3,6)]

# Excercise - Get first 5 records of brands
oj$brand[1:5]

oj[1:5,2]

#Logical operators - >, >=, <, <=, ==, !=  or <>
# The result of a logical operation is >>  TRUE or FALSE


## ------------------------------------------------------------------##
##---------DATA MANIPULATIONS----------##
## ------------------------------------------------------------------##

# Now we will do data manipluations using both Base R and dplyr functions and 
# compare

# dplyr package to do the same manipluations
# install.packages("dplyr")
library(dplyr)

#Logical Subseting
## == operator 
## (checks for equality of lhs == rhs and returns TRUE or FALSE)


# Find out if data has tropicana brand and paperboat brand?
# Also find the count of records with above 2 brands in data

v1 = c(1,2,3,4,1,2,NA)

v1>2

v1 == 2

sum(oj$brand == "tropicana")

sum(oj$brand == "paperboat")

unique(v1)

table(v1)

sum(oj$brand == "tropicana")

sum(oj$brand == "dominicks")

sum(oj$brand == "dominicks" | oj$brand == "tropicana")

unique(oj$brand)

table(oj$brand)  # get the freq count for each category that is there in a var

table(oj$feat)

# Using similar concept now get all the records of the dataset
# where brand is tropicana. Hint: remember traversing a data frame

unique(oj$brand)

## ------------------------------------------------------------------##
## ---- FILTERING/ SUBSETTING DATA ---- ##
## ------------------------------------------------------------------##

# Excercise- Select only those rows where brand bought is tropicana. 
# What is the class of the output data
oj$brand == "tropicana"

# indexer brackets --- you do not necessarily have to put index values of each row/ col
# yu can as well pass a logical vector with T/F
# TRUE -- SELECT THE RECORD
# FALSE -- REJECT THE RECORD

# Base R code - indexer brackets

oj[oj$brand=='tropicana',] # base r

filter(oj,brand =="tropicana") #dplyr

bs_flt1<-oj[oj$brand=='tropicana',]
unique(bs_flt1$brand)
class(bs_flt1)

# dplyr -- function_name (file, task )
# dplyr code - filter(<dfname>,<filter_condns>)
dp_flt1<-filter(oj,brand =="tropicana")
class(dp_flt1)

## ------------------------------------------------------------------##
## ---- SELECTING COLUMNS ---- ##
## ------------------------------------------------------------------##

# Base R code- indexer bracket
bs_sel1<-oj[,c("week","brand", "INCOME", "feat")]
head(bs_sel1)


# select(oj, week,brand,INCOME, feat)

# dplyr code - select(<df_name>,<list of columns separated by commas>)
dp_sel1<-select(oj,week,brand,INCOME,feat)
head(dp_sel1)

## ------------------------------------------------------------------##
## ---- DELETING/ REMOVING COLUMNS ---- ##
## ------------------------------------------------------------------##

# Base R code - indexer brackets with - (minus sign) against column names
bs_sel2 <- oj[,c(-2,-5, -10)] #hard coding.. not advisable
head(bs_sel2)
oj[,-5]
oj[,-"feat"]
# dplyr code - 
# select(<df_name>, <list of columns preceded by minus sign and  separated by commas>)
dp_sel2<-select(oj,-brand,-INCOME,-feat)
head(dp_sel2)

## ------------------------------------------------------------------##
## ----- SUBSETTING + SELECTING ----- ##
## ------------------------------------------------------------------##

# Select weeks and store, feat when brand bought is tropicana and 
# no feature advertisement is run

# Base R code - use indexer brackets
bs_flt_sel1<-oj[oj$brand=='tropicana' & oj$feat==0,c("week","store","feat","brand")]
head(bs_flt_sel1)
dim(bs_flt_sel1)

# dplyr code - filter and select together
# 2 step
d1<- filter(oj,brand == 'tropicana' & feat == 0)
d2<- select(d1,week, store, feat,brand)

select(filter(oj,brand == 'tropicana' & feat == 0),week, store, feat,brand)

# pipelines
# symbol - %>%

d3<- oj %>% filter(brand == 'tropicana' & feat == 0) %>% 
  select(week, store, feat,brand) 

# In 1 step
dp_flt_sel1 <- select(filter(oj,brand == 'tropicana' & feat == 0),week,store,feat,brand)

## ------------------------------------------------------------------##
## ----- ADDITION OF NEW COLUMN IN DATA ----- ##
## ------------------------------------------------------------------##

# Very common application in modeling to try different transformations
# ?? What is data transformation?

# Base R code
# Create a column calculated as log of INCOME column
oj$logInc<-log(oj$INCOME)
dim(oj)

oj$rev <- exp(oj$logmove)*oj$price
oj1<- select(oj, rev, price, logmove)

# logmove column is log(move), where move is nothing but 
# juice quantity sold. Write a transformation query to get 
# revenue variable in the data
# Excercise - Revenue Column - another real scenario where KPI needs to be calculated
# Move is qty sold for juice, logmove is log of qty
# Exponentiating will give original value of qty

oj$revenue<-exp(oj$logmove)*oj$price
dim(oj)


# dplyr code
# We can create multiple columns in one go - 1 single line of code
oj <- mutate(oj,dp_logInc=log(INCOME),dp_rev=exp(logmove)*price)
dim(dp_oj1)
names(dp_oj1)

log(10)

exp(1)

2.718282^2.302585

exp(9.018695)

## ------------------------------------------------------------------##
## ----- ARRANGING/ SORTING DATA ----- ##
## ------------------------------------------------------------------##

# Base R function
# Sorting data frame - use order function

# Ascending order
bs_ord1_asc<-oj[order(oj$week),]  #ascending
head(bs_ord1)
min(oj$week)

# Descending order
bs_ord1_desc<-oj[order(-oj$week),]   #descending
head(bs_ord1_desc)
max(oj$week)  


#? How to sort by 2 or more columns. 
# Give column names separated by comma in order

# dplyr code - arrange(<df_name>,<list of sort columns in order of sort)
 
# Ascending
dp_ord1_asc<-arrange(oj,week)

# Desending
dp_ord1_desc_1<-arrange(oj,week,desc(INCOME))
#OR
dp_ord1_desc_2<-arrange(oj,-INCOME)

## ------------------------------------------------------------------##
## ----- AGGREGATION/ GROUPING DATA/ ROLLING UP DATA ----- ##
## ------------------------------------------------------------------##

# Base R code - Use aggregate function or tapply function

# Get Mean price of juice across brands

#Summarize-Price
#Summarize by-Brand (factor)
#Summarize how-Mean

#Syntax 
#aggregate(variable to be summarized, by=list(variable by which grouping is to be done),function)

?aggregate
aggregate(oj$price,by=list(oj$brand),mean , na.rm= TRUE)

# Get Mean price of juice across brands and feat comination
aggregate(oj$price,by=list(oj$brand,oj$feat),mean, na.rm= TRUE)

# Note x= data.frame argument when we need more than 1 aggregate var
aggregate(oj[,c("price", "logmove")],by=list(oj$brand,oj$feat),mean, na.rm= TRUE)

# use tapply base R function
tapply(oj$price,oj$brand,sd)
tapply(oj$price,list(oj$brand, oj$feat),sd)
?tapply

# tapply(oj[,"price", "logmove"],list(oj$brand, oj$feat),sd)
# Why does it not work?

# Use tapply - similar kind of syntax in coding but less complex.
# So what is the difference? Output - Array v/s Data frame.
# Array in tapply and DF in aggregate. Use class to test this

class(tapply(oj$price,oj$brand,sd))

class(aggregate(oj$price,by=list(oj$brand),mean , na.rm= TRUE))

# dplyr code for aggregation - 2 steps process
# Create data which is ready to be grouped using group_by function
# Apply summarize function to summarize/ aggregate variables in the grouped data above

# Get Mean price of juice across brands

#Summarize-Price, Income
#Summarize by-Brand (factor)
#Summarize how-Mean

dp_gr_brand<-group_by(oj,brand)
summarize(dp_gr_brand,mean(price),mean(INCOME),min(price), max(price))

dp_gr_brand1<-group_by(oj,brand,feat)
summarize(dp_gr_brand1,mean(price),mean(INCOME),min(price), max(price))


class(oj)
class(dp_gr_brand) # This is a complex Java oriented class name, which R does not understand
# We change the object class using as. function
# This will enable us to use thiS as a data frame for further work in R
gr_brand <- as.data.frame(gr_brand)
class(gr_brand)

## ------------------------------------------------------------------##
## ----- PIPELINES IN DPLYR ----- ## 
## ------------------------------------------------------------------##

#Base R code - let us undertand a complex calculation
mean(oj[oj$INCOME>=10.5,"price"])

#dplyr code
summarize(filter(oj,INCOME>=10.5),mean(price))

# %>% is a pipeline operator

oj%>%filter(INCOME>=10.5)%>%summarize(mean(price))

# Another example of pipelines
oj%>%filter(price>=2.5)%>%
  mutate(logIncome=log(INCOME))%>%
  summarize(mean(logIncome),median(logIncome),sd(logIncome))

## ------------------------------------------------------------------##
## ----- MERGING / JOINING DATA ----- ##
## ------------------------------------------------------------------##

## Joins using Merge

df1 = data.frame(CustomerId=rep((1:6),2), 
                 DayOfWeek = c(rep("Monday",6),rep("Tuesday",6)), 
                 Product=c(rep("Toaster",6),rep("Radio",6)))
df2 = data.frame(CustomerId=c(2,4,6,7),
                 State=c(rep("Alabama",2),rep("Ohio",2)))

df1
df2

fj = merge(x = df1, y = df2, by = "CustomerId", all = TRUE)#Outer join:

lj = merge(x = df1, y = df2, by = "CustomerId", all.x=TRUE)#Left join

rj = merge(x = df1, y = df2, by = "CustomerId", all.y=TRUE)#Right join

ij = merge(x=df1,y=df2,by="CustomerId")#Inner Join/Intersection of both tables



## ------------------------------------------------------------------##
## ----- DATE MANIPLUATIONS ----- ##
## ------------------------------------------------------------------##

fd<-read.csv("Fd.csv")
str(fd)
dim(fd)
class(fd)

# Load library lubridate - this is a package to do date manipulations in data
# install.packages("lubridate")
library(lubridate)
fd$FlightDate<-dmy(fd$FlightDate)

class(fd$FlightDate)

fd$month <- months(fd$FlightDate)

head(months(fd$FlightDate))
unique(months(fd$FlightDate))
head(weekdays(fd$FlightDate))
unique(weekdays(fd$FlightDate))


#Finding time interval
fd$FlightDate[60]-fd$FlightDate[900]
difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "weeks")
difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "days")
difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "hours")

#Subsetting data based on time information
library(dplyr)
#Subset the data for day=Sunday
dim(fd)
fd_s<-fd%>%filter(weekdays(FlightDate)=="Sunday")
dim(fd_s)

#Find the number of flights on Sundays for destination Atlanta
fd%>%filter(weekdays(FlightDate)=="Sunday",
            DestCityName=="Atlanta, GA")%>%nrow()

#Find the number of flights on Sundays by cities
xyz <- fd%>%filter(weekdays(FlightDate)=="Sunday")%>%
  group_by(DestCityName)%>%summarize(n())


xyz_ls<- strsplit(xyz$DestCityName,split=", ")
xyz_ls[[5]][2]
## ------------------------------------------------------------------##
## ----- STRING MANIPULATIONS ----- ##
## ------------------------------------------------------------------##

a<-"Batman"

# Getting a portion of string
substr(a,start=4,stop=6)

# No. of char in a
nchar(a)

# All lower case
tolower(a)

# All upper case
toupper(a)

b<-"Bat-Man"

# Spliiting a string using a known separator
strsplit(b,split="-")

c<-"Bat/Man"

strsplit(c,split="/")

#concatenate
paste(b,c)

b

# Return 1 or 0 based on if the search string is found in the character variable
grep("-",b)

grepl("/",c)

# Replace - by /
sub("-","/",b)

d<-"Bat-Ma-n"

# Replace - by / (limit only for first point search)
sub("-","/",d)

# Replace all - by /
gsub("-","/",d)

## ------------------------------------------------------------------##
## ----- MISSING VALUE IDENTIFICATION AND TREATMENT ----- ##
## ------------------------------------------------------------------##

a<-c(1,2,3,4,5,6,NA,NA,NA,7,8,9)
is.na(a)
sum(a)
mean(a)
sum(is.na(a))
sum(a,na.rm = TRUE)
mean(a,na.rm = TRUE)

air<-airquality
head(air)

sum(is.na(air$Ozone))

sum(is.na(air$Solar.R))

# Doing it for the entire dataset at once
colSums(is.na(air))

#Imputing Missing values

#one way
summary(air)
air$Ozone[is.na(air$Ozone)]<-45

# other way
air$Solar.R[is.na(air$Solar.R)]<-mean(air$Solar.R,na.rm=TRUE)

summary(air)

## ------------------------------------------------------------------##
## ----- USING SQL QUERY IN R TO FETCH DATA ----- ##
## ------------------------------------------------------------------##

install.packages("sqldf")
library(sqldf)

oj_select <- sqldf("select brand, week, feat from oj")

oj_where <- sqldf("select brand, week, price, income from oj where
                  price < 2.5 and income >10")

oj_order <- sqldf("select brand, week, price, income from oj 
                  order by price desc")


## ------------------------------------------------------------------##
## ----- EXTRAS ------ ## 
## ------------------------------------------------------------------##

#Subsetting using which() operator
# Note that which function doesn't create a data frame as such,
# but a list of integers/ row numbers having relevant records


ind<-which(oj$brand=="dominicks")
head(ind)   #this gives you row numbers/ integers of brand 'dominicks'
class(ind) #check the class

# Create data frame using row numbers fetched
dat3<-oj[ind,] 

#Using Or condition, brand bought is tropicana or dominicks


dat1<-oj[oj$brand=='tropicana'|oj$brand=='dominicks',]
head(dat1)
dim(dat1)


# Using And condition, brand bought is tropicana and 
# no feature advertisement is run

dat2<-oj[oj$brand=='tropicana' & oj$feat==0,]
head(dat2)
dim(dat2)


#Sorting data using order and sort function
numbers<-c(10,100,5,8)
order(numbers)
order(-numbers)
numbers_s<- sort(numbers, decreasing = FALSE)
numbers_s