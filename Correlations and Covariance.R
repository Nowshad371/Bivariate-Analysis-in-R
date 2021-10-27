
#Pearson's correlation is a parametric measure of the linear association 
#between 2 numeric variable

#Spearman's rank correlation is a non-paramatric measure of the monotonic 
#association between 2 numaric variables

#Kendall's rank correlation is another non-paramatric measure of the 
#association, based on concordance or discordance pf x-y pairs

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


?cor.test


plot(Age,ï..LungCap,main = "Scartterplot",las = 1)






cor.test(ï..LungCap, Age)

cor.test(Age,ï..LungCap)




cor(ï..LungCap, Age,
          method = "spearman")


cor(Age,ï..LungCap,
     method = "kendall")



cor(ï..LungCap, Age,
          method = "pearson")


cor.test(ï..LungCap, Age,
          method = c("pearson"),
          conf.level = 0.95)



cor.test(ï..LungCap, Age,
          method = c("spearman"),
          conf.level = 0.95,exact = F)





#coverence betwen age and lung capacity

cov(ï..LungCap,Age)



pairs(lung[,1:3])

cor(lung[,1:3])

cor(lung[,1:3],method = "pearson")

