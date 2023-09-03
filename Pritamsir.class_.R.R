#=======================================================
data("mtcars")

head(mtcars)


attach(mtcars)

mean(mtcars$mpg)
var(mtcars$mpg)
sd(mtcars$mpg)
range(mtcars$mpg)

apply(mtcars, 2, mean)

# install.packages("moments") # installs the packages (to be done once in your machine)
library(moments) # invokes the library which needs to be done in every session
#library(help="moments")

skewness(mtcars$mpg)
kurtosis(mtcars$mpg)


#========================================================

plot(mtcars$mpg)
plot(mtcars$mpg, mtcars$hp)

cor(mtcars$mpg, mtcars$hp)

table(mtcars$cyl)

plot(mtcars$mpg, mtcars$hp, 
     xlab="Mileage per gallon", ylab="Horse Power")

plot(mtcars$mpg, mtcars$hp,
	xlab="Mileage per gallon",
	ylab="Horse Power",
	col="red")
	
plot(mtcars$mpg, mtcars$hp,
     cex=(mtcars$cyl/2),
xlab="Mileage per gallon",
     col="red",
     ylab="Horse Power")

plot(mtcars$mpg, mtcars$hp,
	xlab="Mileage per gallon",
	ylab="Horse Power",
	col=(mtcars$am+2),
	cex=(mtcars$cyl/2))

table(mtcars$cyl)

plot(mtcars$mpg, mtcars$hp,
	xlab="Mileage per gallon",
	ylab="Horse Power",
	#col=(mtcars$cyl/2),
	#cex=(mtcars$cyl/2),
	col=(mtcars$am+1),
	cex=(mtcars$am+1),
	pch = "*")
	

#dat2 = cbind(mtcars$mpg, mtcars$disp, mtcars$drat)
#dat3 = data.frame(mtcars$mpg, mtcars$disp, mtcars$drat)

#write.csv(mtcars,"my1_mtcars_data.csv")
#write.csv(dat2,"my2_mtcars_data.csv")
#write.csv(dat3,"my3_mtcars_data.csv")


#=======================================================

dat = read.csv("Patent_Data_v2.csv")
head(dat)

print(names(dat))

dim(dat)

plot(dat$FilingYear)
barplot(table(dat$FilingYear))
barplot(table(dat$FilingYear),las=2)

barplot(table(dat$FilingYear),
	las=2,horiz = TRUE)

barplot(table(dat$Renewalyear),las=1)
table(dat$Renewalyear)


help("barplot")
barplot(table(dat$Renewalyear),las=1)
barplot(table(dat$GrantLag),las=1)

barplot(table(dat$NumOfClaims))
table(dat$NumOfClaims)

plot(dat$NumOfClaims, dat$InventorSize)

pie(table(dat$Techclass_))


plot(dat$NumOfClaims, dat$InventorSize,
	col = factor(dat$Techclass_))

plot(dat$NumOfClaims, dat$InventorSize,
	col = factor(dat$Techclass_),pch=19)
	
summary(lm(Renewalyear~., data=dat))

#=========================================================

dat=read.csv("PMKVY_Full_20L.csv")
print(names(dat))

table(dat$Gender)

table(dat$Category, dat$Gender)

help("read.csv")
tt = dat$MobileNo[1:10]

hich(dat=="NULL")

which(dat$MobileNo=="NULL")
which(dat$Gender=="NULL")
which(dat$Candidate.Name=="NULL")
which(dat$SectorName=="NULL")
which(dat$EmployerType=="NULL")

id=which(dat$EmployerType=="NULL")
length(id)

table(dat$EmployerType)


#---------------------
x = 1:10
x[3]=NA
mean(x)
mean(x,na.rm=TRUE)
#---------------------

length(unique(dat$CandID))
nrow(dat)
length(unique(dat$Candidate.Name))
dat$Candidate.Name[1:10]

hh=table(dat$Candidate.Name)
gg=sort(hh,decreasing = TRUE)

length(unique(dat$MobileNo))

idd = paste(dat$Candidate.Name, dat$AadhaarNumber, dat$Category, dat$Gurdian.Name)
idd[1:5]
length(unique(idd))
nrow(dat)


