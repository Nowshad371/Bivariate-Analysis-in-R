#these are parametric methods appropriate for examining the difference 
#in means for 2 populations that are paired or dependent on one another
 

BP = read.table(file.choose(),header =  T,sep = '\t')

View(BP)

names(BP)

attach(BP)
dim(BP)


BP[1:3,]


boxplot(Before,After)

plot(Before,After)

abline(a=0,b=1)

#here in the line the intercept is 0 and slope is 1.

#this 45 degree line is a line for x equal to y or before equal to after.

#if there is no change in BloodPressure points should fall on this diagonal 

#line and be equal scattered above

#Again if there is decrease in Bloodpressure after treatment 

#more pont should fall below the line than above 



#paired t-test

#Ho : mean difference in SBP (systolic blood pressure) is 0
#two-sided test

help("t.test")


t.test(Before, After,
       alternative = "two.sided",
       mu = 0, paired = T,
       conf.level = 0.99)


#mu = mu argument

#here we gave paired argument = true to let program know we want paired t-test

#here confidence level is 99%

#df = degree of freedom

#test statistics is 3.88


#99% confidence interval runs from 2.245 up to 13.754

#and sample mean difference is 8

















