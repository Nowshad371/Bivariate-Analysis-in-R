getwd()
lung = read.csv(file ="C:/Users/Nowshad/Documents/LungCapData.csv")
View(lung)
attach(lung)

names(lung)
class(ï..LungCap)
class(Smoke)


#Mann Whitney is also known as Wilcox Rank

#what is Wilcox rank
#This is a non-paramatric method appropriate for examining 
#the difference in Medians for 2 independent population

#ans: It is a way of examing the relationship between a numeric
#outcome variable (y) and a categorical explantory variable (x,with 2 levels)
#when group are independent


#to check the details about Wilcoxon Rank sum and signed rank tests
#we can either use help method or question mark
help(wilcox.test)
?wilcox.test


boxplot(ï..LungCap~Smoke)

#Ho: Median of Smokers = that of non Smokers
#Two sided test

wilcox.test(ï..LungCap~Smoke,
            alternative = "two.sided",
            mu = 0, paired = FALSE, exact = TRUE, correct = TRUE,
            conf.int = TRUE, conf.level = 0.95)



#Here we have given 
#conf.int = TRUE to have non-parametric confidence interval returned to us
#Paired = False to let R know that these groups are not paired (these are independent)
#exact = TRUE to have an exact p-value computed, not an approximate
#correct = TRUE if we would like R to use a continuity correction


#in result difference in location represents difference in medians


wilcox.test(ï..LungCap~Smoke,
             alternative = "two.sided",
             mu = 0, paired = FALSE, exact = F, correct = TRUE,
             conf.int = TRUE, conf.level = 0.95)
