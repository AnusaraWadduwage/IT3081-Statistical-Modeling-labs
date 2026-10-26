#Part 3
#Load the Data 

library(ISLR) 
data("Hitters") 
sum(is.na(Hitters)) # Check for missing values 
Hitters = na.omit(Hitters) # Remove rows with missing values 
nrow(Hitters) # Number of rows after cleaning 

#Best Subset Selection 

library(leaps) 
best = regsubsets(Salary~., data = Hitters, nvmax = 19) # Perform Best Subset Selection
results = summary(best)
print(results)

# Model selection metrics 
RSS = results$rss 
r2 = results$rsq 
Cp = results$cp 
BIC = results$bic 
Adj_r2 = results$adjr2 
cbind(RSS, r2, Cp, BIC, Adj_r2) # Combine and display metrics 

# Identify the best models 
which.min(Cp) # Model with minimum Cp 
which.min(BIC) # Model with minimum BIC 
which.max(Adj_r2) # Model with maximum Adjusted R-squared

coef(best, 10) # Coefficients for the model with 10 predictors (based on Cp)
coef(best, 6)  # Coefficients for the model with 6 predictors (based on BIC)
coef(best, 11) # Coefficients for the model with 11 predictors (based on Adjusted R-squared)

#Forward Stepwise Selection 

fwd = regsubsets(Salary~., data = Hitters, nvmax = 19, method = "forward")
results = summary(fwd) 
print(results)

# Model selection metrics
RSS = results$rss 
r2 = results$rsq 
Cp = results$cp
BIC = results$bic
Adj_r2 = results$adjr2 
cbind(RSS, r2, Cp, BIC, Adj_r2) 

# Identify the best models
which.min(Cp)
which.min(BIC)
which.max(Adj_r2) 

coef(fwd, 10) # Coefficients for the model with 10 predictors (based on Cp) 
coef(fwd, 6)  # Coefficients for the model with 6 predictors (based on BIC)
coef(fwd, 11) # Coefficients for the model with 11 predictors (based on Adjusted R-squared)

#Backward Stepwise Selection 

bwd = regsubsets(Salary~., data = Hitters, nvmax = 19, method = "backward") 
results = summary(bwd)
print(results)

# Model selection metrics 
RSS = results$rss
r2 = results$rsq 
Cp = results$cp
BIC = results$bic
Adj_r2 = results$adjr2
cbind(RSS, r2, Cp, BIC, Adj_r2)

# Identify the best models 
which.min(Cp) 
which.min(BIC)
which.max(Adj_r2) 

coef(bwd, 10) # Coefficients for the model with 10 predictors (based on Cp)
coef(bwd, 8)  # Coefficients for the model with 8 predictors (based on BIC) 
coef(bwd, 11) # Coefficients for the model with 11 predictors (based on Adjusted R-squared) 
