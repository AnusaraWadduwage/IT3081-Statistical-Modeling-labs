#Lab Sheet 07 
#PART 01 

#Multinomial Logistic Regression 

#Step 1: Load the Required Library 
library(nnet) 

#Step 2: Load and Examine the Iris Dataset 
data("iris") 
head(iris) 
str(iris) 

#Step 3: Build the Multinomial Logistic Regression Model 
model_multinomial = multinom(Species ~ ., data = iris) 
summary(model_multinomial) 

#Model Building Interpretation 
#PART 02 
#Step 1: Load the Required Library 

library(MASS) 

#Step 2: Load and Examine the Housing Dataset 
data("housing", package = "MASS") 
head(housing) 
str(housing) 
levels(housing$Sat) 

#Step 3: Build the Ordinal Logistic Regression Model 
model_ordinal = polr(Sat ~ Infl + Type + Cont,weights = Freq,data = housing, Hess = TRUE) 
summary(model_ordinal) 

#Model Building Interpretation 
#PART 03 
#Step 1: Load and Examine the Warpbreaks Dataset 

data("warpbreaks") 
head(warpbreaks) 
str(warpbreaks) 

#Step 2: Build the Poisson Regression Model 
model_poisson = glm(breaks ~ wool + tension, data = warpbreaks,  family = poisson(link = "log")) 
summary(model_poisson) 

#Step 3: Obtain Incidence Rate Ratios 
exp(coef(model_poisson)) 

#Model Building Interpretation 

#PART 04 
#Step 1: Load and Examine the Puromycin Dataset 
data("Puromycin") 
head(Puromycin) 
str(Puromycin) 

#Step 2: Prepare the Data for Exponential Regression 
model_exponential = lm(log(rate) ~ conc, data = Puromycin) 
summary(model_exponential) 

#Step 3: Obtain the Exponential Model Parameters 
a = exp(coef(model_exponential)[1]) 
b = coef(model_exponential)[2] 
a
b

#Model Building Interpretation 
#PART 05 
#Step 1: Load and Examine the USArrests Dataset 
data("USArrests") 
head(USArrests) 
str(USArrests) 

#Step 2: Build the Gamma Regression Model 
model_gamma = glm(Assault ~ Murder + UrbanPop + Rape, data = USArrests,family = Gamma(link = "log")) 
summary(model_gamma) 

#Step 3: Obtain Multiplicative Effects 
exp(coef(model_gamma)) 
