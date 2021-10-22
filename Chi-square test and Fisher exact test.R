getwd()
lung = read.csv(file ="C:/Users/Nowshad/Documents/LungCapData.csv")
View(lung)
attach(lung)

names(lung)
class(ï..LungCap)

class(Smoke)

Smoke = as.factor(Smoke)
class(Smoke)

levels(Smoke)
#to check the details about chi-squre we can either use help method or question mark

tab = table(Gender,Smoke)

barplot(tab,beside = 1,legend = T)


?chisq.test

chisq.test(tab, correct = TRUE)


CHI = chisq.test(tab, correct = TRUE)

attributes(CHI)

CHI$expected



#We can also use Fisher's exact test
#Fisher's exact test is a non-parametric alternative to chi-square

?fisher.test


fish = fisher.test(tab, conf.int = TRUE, conf.level = 0.95)


#cinf.int = true if we would like to have a confidence interval
#for the odds ratio returned

attributes(fish)
fish$estimate

