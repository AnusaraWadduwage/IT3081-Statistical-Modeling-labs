#Lab Sheet 05 
#Part 01 

#Step 1: Set the Working Directory 
setwd("C:/Users/Anusara/Downloads/Lab5") 

#Step 2: Load the Data 
df=read.table("leukemia_remission.txt",header = TRUE) 
df

#Part 02 
#Modeling 
model1=glm(REMISS~LI,data=df,family = "binomial") 
summary(model1) 
confint(model1) 

#Interpreting Model 1 

#Adding a Second Predictor 
model11=glm(REMISS~LI+TEMP,data=df,family = "binomial") 
summary(model11) 

#Part 03 
#Full Model 
model2=glm(REMISS~.,data=df,family = "binomial") 
summary(model2) 
confint(model2) 
exp(coef(model2)) 

#Part 04 
#Null Model 
model3=glm(REMISS~1,data=df,family = "binomial") 
summary(model3) 

#Hosmer-Lemeshow Test 
library(ResourceSelection) 
fitted(model1) 
hoslem.test(df$REMISS, fitted(model1)) 
