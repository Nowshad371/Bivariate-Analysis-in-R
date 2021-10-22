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


#we will explore the relationship between gender and smoke

#firstly we will be creating two-way table and saving it 
#in tab object

tab = table(Gender,Smoke)

barplot(tab,beside = 1,legend = T,las = 1)

install.packages("epiR")
library(epiR)

?epi.2by2


epi.2by2(tab, method = "cohort.count", conf.level = 0.95)


#method = cohort.count if data come from cohort study
#method = case.control for case-control study
#note: if we set method to case-study the relative risk will no be returned

#here            Odds ratio                0.71 (0.44, 1.14)

#means the difference between male and female is 0.71 that is the odds
#of a female not smoking are 0.71 times the odds of a male not smoking

#if we take inverse of 1/0.71 we can have female as the reference group
#1.408451 
#now we can have the odds of a not male smoking are 1.4 time the odds 
#of a female not smoking

              # Y

    #        yes      no
    #yes  |   a   |   b   |
#X        |       |       |
    #no   |   c   |   d   |



#if we want to set this table in standard a,b,c,d table (shown above)
#we can do it by using matrix
tab

#Smoke
#Gender    no   yes
#female    314  44
#male      334  33

tab2 = matrix(c(44,314,33,334),nrow = 2,byrow = T)

tab3 = cbind(tab[,2],tab[,1])

colnames(tab3) = c("yes","no")


rownames(tab2) = c("female","male")
colnames(tab2) = c("yes","no")


epi.2by2(tab2, method = "cohort.count", conf.level = 0.95)

#the odds of a female  smoking are 0.71 
#times the odds of a male smoking


#here the confidence interval contains the value 1 indicating that 
#the odds ratio is not significant