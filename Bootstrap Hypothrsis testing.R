getwd()
ChickData= read.csv(file ="C:/Users/Nowshad/Documents/ChickData.csv")
names(ChickData)

attach(ChickData)

class(weight)
levels(feed)

feed = as.factor(feed)
levels(feed)

View(ChickData)

boxplot(weight~feed)


help("boxplot")


boxplot(weight~feed,las = 1,
        xlab = "feed",
        ylab = "weight (g)",main ="Weight by feed")



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

#Independent two sample t-test
t.test(weight~feed,paired =F,var.eq = F)

#Wilcox aka Mann-Whitney U

wilcox.test(weight~feed,paired = F)


#Kolmogorov-Smirnov 2-sample test

ks.test(weight[feed == "casein"],weight[feed == "meatmeal"],paired =F)

# Lets see BootStrspping

set.seed(112358)
n = length(feed)
n
b = 10000

variable = weight

#Bootstrap samples without loops

Bootstrap = matrix(sample(variable,size = n*b,replace = T),nrow = n,ncol = b)



#here in the above a matrix is created as Bootstrap in which we have 10k coloumns and 23 rows

dim(Bootstrap)


#Now we need to calculate the means (Yc and Ym) test.stat1 and test.stat2 for each of the 10 thousands
#Bootstrap sample or each of the coloumn



#initialize the vector to store the TEST-STATS
Boot.test.stat1 <- rep(0,b)
Boot.test.stat2 <- rep(0,b)


for(i in 1:b){
  Boot.test.stat1[i] <- abs(mean(Bootstrap[1:12,i])  - mean(Bootstrap[13:23,i]))
  
  Boot.test.stat2[i] <- abs(median(Bootstrap[1:12,i])  - median(Bootstrap[13:23,i]))
  
}



test.stat1
test.stat1


#first 20 Bootstrap - test stats for 1 and 2
round(Boot.test.stat1[1:20],1)
round(Boot.test.stat2[1:20],1)

#lets calculate bootstrap p-value
#lets notice first 20 value

(Boot.test.stat1 >= test.stat1)[1:20]

#calculate the p-value
mean(Boot.test.stat1 >= test.stat1)

#ans: here p-value is 0.0922 = 9.22%

#therefore ou of the 10,000 bootstrap test statistics calculated, 
#922 of them had test statistics greater than the observed one
# p value ~ 9 %
#If there is no difference in the mean weights, 
#we would see a test statistic of 46.67 or more by chance roughly 8% of the time
#here p value tells us what is the probability of getting the test statistic 
#we got, or one more extreme, if Ho is true


#lets calculate the p-value for the statistic 2 (abs diff in meadian) too
mean(Boot.test.stat2 >= test.stat2)

#Now recall the difference between "statistical significance" and 
#"scientific sigificance

#in a "real-world" what you want to conclude here

table(feed)


#lets take a look at a density plot of all the Bootstrap test-stats and 
#add in our observed test stat

plot(density(Boot.test.stat1),xlab = expression(group("|",bar(Yc)) - bar(Ym),"|"))









