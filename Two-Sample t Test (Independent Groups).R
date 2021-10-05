getwd()
lung = read.csv(file ="C:/Users/Nowshad/Documents/LungCapData.csv")
View(lung)
attach(lung)

names(lung)
class(ï..LungCap)
class(Smoke)

?factor
#changing Smoke attribute as factor from null
Smoke = as.factor(Smoke)

#or 
Smoke = as.factor(ifelse(is.na(Smoke), "NA", Smoke))


class(Smoke)

levels(Smoke)


#to check the details about t.test we can either use help method or question mark
help(t.test)
?t.test

#before going to do the t.test we may first see the situation of the target attributes using boxplot or other graph

boxplot(ï..LungCap ~ Smoke)

#we will be seeing t.test of the attribute while null 
#hypothesis is mean of Smoker = non Smoker
#Ho:mean of smoker = non Smoker;
#two-sided test
#assume non-equal variances


t.test(ï..LungCap~Smoke,
       alternative = "two.sided",
       mu = 0, paired = FALSE, var.equal = FALSE,
       conf.level = 0.95)

#or 
t.test(ï..LungCap[Smoke =="no"],ï..LungCap[Smoke =="yes"])


#assume poplation varience are ture 
t.test(ï..LungCap~Smoke,
        alternative = "two.sided",
        mu = 0, paired = FALSE, var.equal = TRUE,
        conf.level = 0.95)

#how to assume equal or not equal variance

#We can do it by either observing boxplot

boxplot(ï..LungCap~Smoke) #we can see level "no" is almost double in the figure

#or we can also do it by

var(ï..LungCap[Smoke == "yes"])

#result 3.545292
var(ï..LungCap[Smoke == "no"])

#result 7.431694 (here no is almost double than yes so its not equal)


#we can also use levene's test. To apply this we have to install package name car
#this method used to see null hypothesis of population varience are equal

#Ho: population varience are equal

install.packages("car")

#load the library
library(car)

leveneTest(ï..LungCap~Smoke)  # ~ = split/separate

#here we can see with the small p value 0.0003408 *** we should remove the null hypothesis
#conclude : we have evidence to believe that population variance are not equal
#so that us the non equal assumtion 

