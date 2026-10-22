#Lab 6
#Part 2
#Naive Bayes Classification 

#Step 1: Load the Required Library 

library(e1071)

#Step 2: Load and Examine the Iris Dataset 

data("iris") 
head(iris)
str(iris)

#Step 3: Build the Naive Bayes Model 

model = naiveBayes(Species ~ ., data = iris)
print(model)

#Step 4: Predict the Species of a New Flower 

new_data = data.frame(Sepal.Length = 4.7, 
                      Sepal.Width = 3.2, 
                      Petal.Length = 1.3, 
                      Petal.Width = 0.2) 
prediction = predict(model, newdata = new_data)
print(prediction)

#Step 5: Evaluate the Naive Bayes Model 

predictions = predict(model, newdata = iris) 
confusion_matrix = table(Predicted = predictions, Actual = iris$Species) 
print(confusion_matrix) 

accuracy = sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", round(accuracy, 2))) 

#PART 01

#Step 1: Load the Required Library 
library(MASS) 

#Step 2: Load and Examine the Iris Dataset 
data("iris") 
head(iris)
str(iris)
df= iris

#Step 3: Divide the Data into Training and Testing Sets 
set.seed(2222)
trainID=sample(1:nrow(df),0.8*nrow(df))

train=df[trainID,]
test=df[-trainID,]

#Step 4: Build the LDA Model 
fit=lda(Species~.,data = train)
fit

#Step 5: Predict and Evaluate the LDA Model 

y_pred=predict(fit,test)
y_actual=test$Species
conf=table(y_actual,y_pred$class)
conf
sum(diag(conf))/sum(conf)*100

#Step 6: Build the QDA Model 
fit=qda(Species~.,data = train)
fit

#Step 7: Predict and Evaluate the QDA Model 
y_pred=predict(fit,test)
y_actual=test$Species
conf=table(y_actual,y_pred$class)
conf
sum(diag(conf))/sum(conf)*100
