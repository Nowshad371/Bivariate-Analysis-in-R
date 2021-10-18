ChickData= read.csv(file ="C:/Users/Nowshad/Documents/ChickData.csv")
names(ChickData)

attach(ChickData)

class(weight)
levels(feed)

feed = as.factor(feed)
levels(feed)

View(ChickData)

boxplot(weight~feed)
table(feed)

help("boxplot")

boxplot(weight~feed,
        xlab = "Feed",
        ylab = "weight", main = "weight vs feed",las = 1 )



#Let calculate the difference in sample means

mean(weight[feed == "casein"]) #mean for casein

mean(weight[feed == "meatmeal"]) #mean for meatmeal

#we can also do this by applying tapply method

with(ChickData,tapply(weight,feed,mean))

#let us calculate the absolute diff in means

test.stat1 = abs(mean(weight[feed =="casein"]) - mean(weight[feed == "meatmeal"]))

#we can also do this by applying tapply method

abs(diff(with(ChickData,tapply(weight,feed,mean))))

median(weight[feed == "casein"]) #mean for casein

median(weight[feed == "meatmeal"]) #mean for meatmeal

#we can also do this by applying tapply method

with(ChickData,tapply(weight,feed,median))



test.stat2 = abs(median(weight[feed =="casein"]) - median(weight[feed == "meatmeal"]))

#we can also do this by applying tapply method

abs(diff(with(ChickData,tapply(weight,feed,median))))

# Lets see BootStrspping
#for reproducability of result
set.seed(112358)
n = length(feed)
n
b = 10000

variable = weight



#Bootstrap samples without loops

permuSample = matrix(0,nrow = n,ncol = b)
dim(permuSample)

for(i in 1:b){
  permuSample[,i] <- sample(variable,size = n,replace = F)

  
}
permuSample[,1:5]

per.test.stat1 <- rep(0,b)
per.test.stat2 <- rep(0,b)



for(i in 1:b){
  per.test.stat1[i] <-  abs(mean(permuSample[feed =="casein",i]) - mean(permuSample[feed == "meatmeal",i]))
  
  per.test.stat2[i] <- abs(median(permuSample[feed =="casein",i]) - median(permuSample[feed == "meatmeal",i]))
  
}




test.stat1;test.stat2;

round(per.test.stat1[1:15],1)
round(per.test.stat2[1:15],1)


(per.test.stat1 >= test.stat1)[1:15]


#p-value for all 10000

mean((per.test.stat1 >= test.stat1)[1:15])

#of them 15 permutation test statistics calculated only 13.3% have chance to 
#be greater than the observe one or observe mean.


#let see for all value that is 10000

mean(per.test.stat1 >= test.stat1)


#of them 100 permutation test statistics calculated only 10.1% have chance to 
#be greater than the observe one or observe mean.



#let see p value for statistics 2

(per.test.stat2 >= test.stat2)[1:15]



mean((per.test.stat2 >= test.stat2)[1:15])

#of them 15 permutation test statistics calculated only 6.67% have chance to 
#be greater than the observe one or observe mean.



mean(per.test.stat2 >= test.stat2)


#of them 100 permutation test statistics calculated only 5.4% have chance to 
#be greater than the observe one or observe mean.
        