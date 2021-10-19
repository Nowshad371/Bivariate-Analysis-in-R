#these are non-parametric methods appropriate for examining 
#the median difference observation for 2 populations that are paired 
#or dependent on one another

BP = read.table(file.choose(),header =  T,sep = '\t')

View(BP)

names(BP)

attach(BP)
dim(BP)


BP[1:3,]


boxplot(Before,After)

plot(Before,After)

abline(a=0,b=1)




help("wilcox.test")


#wilcox.test

#Ho : median difference in SBP (systolic blood pressure) is 0
#two-sided test

  wilcox.test(Before,After,
              alternative = "two.sided",
              mu = 0, paired = T,
              conf.int = T, conf.level = 0.99)
  
  #if we like to have an approximate p-value and approximate confidence interval
  #calculated we can set exact argument = F(asking R not to try to calculate the 
  #exact p-value and confidence interval)
  #we can also set correct arqument = F(if we like R not use a continuity 
  #correction)
  wilcox.test(Before,After,
              alternative = "two.sided",
              mu = 0, paired = T,
              conf.int = T, conf.level = 0.99,exact = F,correct = F)
  
  
  
  #mu = mu argument
  
  #here we gave paired argument = true to let program know we want paired t-test
  
  #here confidence level is 99%
  
  #here we can see test statistic of 267 the p-value 0f 0.008221
  
  #99% of confidence interval running from 2 up to 14 
  
  #the difference sample median is 7.5
  
 

