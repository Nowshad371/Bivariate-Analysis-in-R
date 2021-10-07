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


#let us calculate the  diff in means: (casein - meatmeal)

obs.diff.mean = (mean(weight[feed =="casein"]) - mean(weight[feed == "meatmeal"]))
obs.diff.mean

#we can also do this by applying tapply method

-diff(with(ChickData,tapply(weight,feed,mean)))

#here we gave - sign infornt of diff to make the value positive

median(weight[feed == "casein"]) #mean for casein

median(weight[feed == "meatmeal"]) #mean for meatmeal

#we can also do this by applying tapply method

with(ChickData,tapply(weight,feed,median))



obs.diff.medeain = (median(weight[feed =="casein"]) - median(weight[feed == "meatmeal"]))

#we can also do this by applying tapply method

-diff(with(ChickData,tapply(weight,feed,median)))

#Independent two sample t-test
t.test(weight~feed,paired =F,var.eq = F)

#Wilcox aka Mann-Whitney U

wilcox.test(weight~feed,paired = F)


#Kolmogorov-Smirnov 2-sample test

ks.test(weight[feed == "casein"],weight[feed == "meatmeal"],paired =F)

# Lets see BootStrspping

set.seed(11371)

n.c = 12
n.m = 13



b = 100000



#Bootstrap samples without loops

Boot.casein = matrix(sample(weight[feed == "casein"],size = b*n.c,replace = T),nrow = n.c,ncol = b)

Boot.meatmeal = matrix(sample(weight[feed == "meatmeal"],size = b*n.m,replace = T),nrow = n.m,ncol = b)

#here in the above a matrix is created as Bootstrap in which we have 10k coloumns and 23 rows

dim(Boot.casein)

dim(Boot.meatmeal)

#Now we need to calculate the means (Yc and Ym) test.stat1 and test.stat2 for each of the 10 thousands
#Bootstrap sample or each of the coloumn


#check to make sure they are not empty

Boot.casein[1:5,1:5]

Boot.meatmeal[1:5,1:5]



#now calculate the difference in Means for each of the bootsamples

Boot.diff.In.Means <- colMeans(Boot.casein) - colMeans(Boot.meatmeal)

length(Boot.diff.In.Means)

#lets look at the first 10 diff in means

Boot.diff.In.Means[1:10]


#calculate the difference in Medians for each of the bootsamples

Boot.diff.In.Medians <- apply(Boot.casein, MARGIN  = 2, FUN = median) -
  
                        apply(Boot.meatmeal,MARGIN = 2, FUN = median)



length(Boot.diff.In.Medians)

Boot.diff.In.Medians[1:10]


#Lets the confidence intervals (using 95% confidence)
#lets look up the percentile method
#first, for the difference in MEANS



#for 95% confidence, it uses the 2.5th and 97.5th percentile of the bootstrap
#distribution of the estimates as the lower and upper bounds of the interval

#It uses the middle 95% of bootstrap estimates (removing the bottom/top 2.5%) to form
#the 95% confidence interval

quantile(Boot.diff.In.Means,prob = 0.025)

quantile(Boot.diff.In.Means,prob = 0.975)



#here we are 95% confident that the true/population difference in means is somewhere
#between -2.43 g and 94.92 g

#casein Reference

#we are 95% confident that the mean weight for the casein is somewhere between 
#-2.43 g lower than meatmeal up tp 94.92 g higher than meatmeal


#similar to mean we can get the difference in Medians

quantile(Boot.diff.In.Medians,prob = 0.025)

quantile(Boot.diff.In.Medians,prob = 0.975)


#we are 95% confident that the median weight for the casein is somewhere between 
#-20 g lower than meatmeal up tp 115.5 g higher than meatmeal



#what do you make of the fact that these both cross 0?


#Apart from "statistical significance", what do you think about "scientific
# significance" here?

#Below is the code to calculate confidence interval using basic method
#Basic method

2 * obs.diff.mean - quantile(Boot.diff.In.Means,prob = 0.975)

2 * obs.diff.mean - quantile(Boot.diff.In.Means,prob = 0.025)


#meadin 
2 * obs.diff.medeain - quantile(Boot.diff.In.Medians,prob = 0.975)

2 * obs.diff.medeain - quantile(Boot.diff.In.Medians,prob = 0.025)











