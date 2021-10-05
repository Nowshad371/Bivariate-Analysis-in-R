getwd()
lung = read.csv(file ="C:/Users/Nowshad/Documents/LungCapData.csv")
View(lung)
attach(lung)

names(lung)
class(ï..LungCap)
#to check the details about t.test we can either use help method or question mark
help(t.test)
?t.test

#before going to do the t.test we may first see the situation of the target attributes using boxplot or other graph

boxplot(ï..LungCap)

#we will be seeing t.test of the attribute while null hypothesis is mean < 8
#Ho:mu < 8;
#one-sided 95% confidence interval for mu



t.test(ï..LungCap,mu=8,alternative = "less",conf.level = 0.95)

#we can also wrtie
t.test(ï..LungCap,mu=8,alt = "less",conf = 0.95)

#two-sided

t.test(ï..LungCap,mu=8,alternative = "two.sided",conf.level = 0.95)

#we can also wrtie
t.test(ï..LungCap,
        alternative = c("two.sided", "less", "greater"),
        mu = 8,
        conf.level = 0.95)



#We can store the result in an object too.

TEST = t.test(ï..LungCap,
     alternative = c("two.sided", "less", "greater"),
     mu = 8,
     conf.level = 0.95)


#attributes of the object, 
#t will allow us to see what attributes are stord within this object call TEST.

attributes(TEST)




#we can extract any of the stored attributes in the TEST object by following below command
#example:

TEST$conf.int
TEST$p.value
