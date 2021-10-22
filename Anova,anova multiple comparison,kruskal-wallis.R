#Anova is a parametric method appropriate for comparing the means for 2 0r more 
#independent populations

WD = read.csv(file ="C:/Users/Nowshad/Documents/DietWeightLoss.xls - example5E.txt.csv")
attach(WD)

View(WD)

Diet = as.factor(Diet)


class(Diet)

levels(Diet)

dim(WD)
boxplot(WeightLoss~Diet)

help("aov")

#Ho:Mean weight Loss is the same for all diets 

anova1 = aov(WeightLoss~Diet)

summary(anova1 )

attributes(anova1)


anova1$coefficients
anova1$rank



summary(anova1)

#here we can see we can reject the null hypothesis and conclude that we have
#evidence to believe not all means are equal. We can use multiple comparisons
#to help us decide which means or diets may differ from the others
#One option to see this is to use "TukeyHSD" command/function

#here we would like to conduct all possible pair-wise comparisons for this
#analysis of variance fit.


TukeyHSD(anova1)

#here we are returned overall ninty-five percent 95% confidence interval
#for the difference in means of all possible pairs
#we are also returned an adjusted p-value

#we can use plot to visualize this tukeyHSD table


plot(TukeyHSD(anova1),las =1)



#producing the kruskal-wallis one-way analysis of variance using ranks

#kruskal-wallis one-way analysis of variance is a non-paramatric equivalent 
#to one-way analysis of variance

kruskal.test(WeightLoss~Diet)






