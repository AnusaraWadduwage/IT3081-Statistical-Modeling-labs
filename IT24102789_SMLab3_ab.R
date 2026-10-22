#Lab sheet 03

#Part1

library(MASS)
data("Boston")
View(Boston)

#Simple Linear Regression 
fit1 = lm(medv~lstat, data= Boston)
summary(fit1)

#Multiple Linear Regression 
fit2 = lm(medv~lstat+black, data = Boston)
summary(fit2)

fit3 = lm(medv~.,data=Boston)
summary(fit3)

fit4 = lm(medv~.-indus, data = Boston)
summary(fit4)

#Splitting Data for Training and Testing 
trainID = sample(1:nrow(Boston), round(0.8 * nrow(Boston))) 
train = Boston[trainID, ] 
test = Boston[-trainID, ] 

#Model Training and Predictions 
fit = lm(medv ~ ., data = train) 
summary(fit) 

y_pred = predict(fit, test) 
y_actual = test$medv 

MSE = mean((y_actual - y_pred)^2) 
RMSE = sqrt(MSE) 
MSE
RMSE

#Handling Dummy Variables 
install.packages("pROC")
library(pROC) 
data("aSAH") 
aSAH$outcome = factor(aSAH$outcome) 
aSAH$gender = factor(aSAH$gender) 
contrasts(aSAH$gender) 

#Model
fit = lm(ndka ~ s100b + outcome + gender, data = aSAH) 
summary(fit) 

#Part 02 
#Assumption 1: Linearity 

plot(Boston$lstat, Boston$medv, main = "Scatterplot of lstat vs medv", 
     xlab = "lstat", ylab = "medv") 
abline(lm(medv ~ lstat, data = Boston), col = "red")

#Assumption 2: Independence 
library(lmtest) 
dwtest(lm(medv ~ lstat, data = Boston)) 

#Assumption 3: Homoscedasticity 
fit = lm(medv ~ lstat, data = Boston) 
plot(fitted(fit), residuals(fit), main = "Residuals vs Fitted Values", 
     xlab = "Fitted Values", ylab = "Residuals") 
abline(h = 0, col = "red")

#Assumption 4: Normality of Residuals 
qqnorm(residuals(fit), main = "Normal Q-Q Plot") 
qqline(residuals(fit), col = "red")

#Additional Test 
shapiro.test(residuals(fit)) 

#Assumption 5: No Multicollinearity 
library(car) 
vif(lm(medv ~ ., data = Boston)) 
